module "iam" {
  source                         = "./iam"
  global_prefix                  = var.global_prefix
  global_short_prefix            = var.global_short_prefix
  relative_prefix                = local.relative_prefix
  relative_short_prefix          = local.relative_short_prefix
  tags                           = var.tags
}