resource "aws_iam_role" "github_oidc_iam_role" {
  name = var.role_name

  assume_role_policy  = data.aws_iam_policy_document.github_oidc_iam_assume_role_policy.json
  managed_policy_arns = var.managed_policy_arns

  tags = var.tags
}


data "aws_iam_policy_document" "github_oidc_iam_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.federated_oidc_provider_arn]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"

      values = length(var.repository_list) > 0 ? var.repository_list : [
        "repo:${var.organization_name}/${var.repository_name}:*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"

      values = [
        var.role_aud,
      ]
    }
  }
}
