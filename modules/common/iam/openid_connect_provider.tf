resource "aws_iam_openid_connect_provider" "github_openid_connect_provider" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  # AWS has the thumbprint already stored in its trusted certificate authorities for GitHub
  thumbprint_list = [
    "d89e3bd43d5d909b47a18977aa9d5ce36cee184c",
  ]

  tags = var.tags
}
