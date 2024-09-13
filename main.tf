module "common" {
  source                                                     = "./modules/common"
  global_prefix                                              = local.global_prefix
  global_short_prefix                                        = local.global_short_prefix
  relative_prefix                                            = local.relative_prefix
  relative_short_prefix                                      = local.relative_short_prefix
  environment_name                                           = "dev"
  tags = merge(
    local.base_tags,
    {
      service-name = "common"
    }
  )
}