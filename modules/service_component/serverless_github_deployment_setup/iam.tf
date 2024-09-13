#Github OIDC IAM
module "sls_github_iam" {
  source                      = "../../service_component/github_oidc_iam"
  role_name                   = "${var.resource_name_prefix}-role"
  repository_name             = var.github_repository_name
  organization_name           = var.github_organization_name
  tags                        = var.tags
  federated_oidc_provider_arn = var.federated_oidc_provider_arn
  managed_policy_arns         = concat([aws_iam_policy.sls_deploy_permissions_policy.arn], var.supplemental_deployment_role_managed_policy_arns)
}


data "aws_iam_policy_document" "sls_deploy_permissions_policy_document" {
  statement {
    actions = [
      "iam:Get*",
      "iam:List*",
      "iam:PassRole",
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:PutRolePolicy",
      "iam:TagRole",
      "iam:UntagRole",
      "iam:DeleteRole"
    ]
    resources = [
      "arn:aws:iam::${var.aws_account_id}:role/${substr(var.resource_name_prefix, 0, 25)}*"
    ]
  }

  statement {
    actions = [
      "cloudformation:ValidateTemplate"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "s3:CreateBucket",
      "s3:DeleteBucket",
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:GetBucketPolicy",
      "s3:PutBucketPolicy",
      "s3:DeleteBucketPolicy",
      "s3:PutBucketAcl",
      "s3:GetEncryptionConfiguration",
      "s3:PutEncryptionConfiguration",
      "s3:ListTagsForResource",
      "s3:TagResource",
      "s3:UntagResource",
      "s3:GetBucketTagging",
      "s3:PutBucketTagging",
    ]
    resources = [
      "arn:aws:s3:::${substr(var.resource_name_prefix, 0, 24)}*"
    ]
  }

  statement {
    actions = [
      "ssm:GetParameter"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.resource_name_prefix}/*"
    ]
  }

  statement {
    actions = [
      "cloudformation:CreateChangeSet",
      "cloudformation:CreateStack",
      "cloudformation:DeleteChangeSet",
      "cloudformation:DeleteStack",
      "cloudformation:DescribeChangeSet",
      "cloudformation:DescribeStackEvents",
      "cloudformation:DescribeStackResource",
      "cloudformation:DescribeStackResources",
      "cloudformation:DescribeStacks",
      "cloudformation:ExecuteChangeSet",
      "cloudformation:ListStackResources",
      "cloudformation:SetStackPolicy",
      "cloudformation:UpdateStack",
      "cloudformation:UpdateTerminationProtection",
      "cloudformation:GetTemplate"
    ]
    resources = [
      "arn:aws:cloudformation:${var.aws_region}:${var.aws_account_id}:stack/${var.resource_name_prefix}*"
    ]
  }

  statement {
    actions = [
      "apigateway:GET"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "lambda:InvokeFunction",
    ]
    resources = [
      "arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:${var.resource_name_prefix}*"
    ]
  }

  statement {
    actions = [
      "events:PutRule",
      "events:DescribeRule",
      "events:PutTargets",
      "events:RemoveTargets",
    ]
    resources = [
      "arn:aws:events:${var.aws_region}:${var.aws_account_id}:rule/${substr(var.resource_name_prefix, 0, 25)}*"
    ]
  }

  statement {
    actions = [
      "logs:*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "apigateway:PUT",
      "apigateway:POST",
      "apigateway:PATCH",
      "apigateway:DELETE",
      "apigateway:GET"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "lambda:Get*",
      "lambda:List*",
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:UpdateFunctionConfiguration",
      "lambda:UpdateFunctionCode",
      "lambda:PublishVersion",
      "lambda:CreateAlias",
      "lambda:DeleteAlias",
      "lambda:UpdateAlias",
      "lambda:AddPermission",
      "lambda:RemovePermission",
      "lambda:InvokeFunction",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:CreateEventSourceMapping",
      "lambda:DeleteEventSourceMapping",
      "lambda:GetEventSourceMapping",
      "lambda:ListEventSourceMappings",
      "lambda:UpdateEventSourceMapping",
      "lambda:PublishLayerVersion",
      "lambda:DeleteLayerVersion"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "sqs:CreateQueue",
      "sqs:DeleteQueue",
      "sqs:AddPermission",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListQueues",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ListQueueTags",
      "sqs:RemovePermission",
      "sqs:TagQueue",
      "sqs:UntagQueue"
    ]
    resources = [
      "arn:aws:sqs:${var.aws_region}:${var.aws_account_id}:${var.resource_name_prefix}*"
    ]
  }


  dynamic "statement" {
    for_each = var.supplemental_deployment_iam_role_permissions
    content {
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}

#Serverless deployment role
resource "aws_iam_policy" "sls_deploy_permissions_policy" {
  name = "${var.resource_name_prefix}-sls-default-deploy-policy"

  policy = data.aws_iam_policy_document.sls_deploy_permissions_policy_document.json
}

