locals {
  base_tags = {
    env = var.workspace_settings.workspace_env
  }
}

locals {
  global_short_prefix = "xcs-${var.workspace_settings.workspace_env}-${var.workspace_settings.global_settings.region_name}"
}

locals {
  global_prefix = "${var.workspace_settings.workspace_name}-${var.workspace_settings.workspace_env}-${var.workspace_settings.global_settings.region_name}"
}

locals {
  relative_short_prefix = "xcs-${var.workspace_settings.workspace_env}-${var.workspace_settings.global_settings.region_name}"
}

locals {
  relative_prefix = "${var.workspace_settings.workspace_name}-${var.workspace_settings.workspace_env}-${var.workspace_settings.global_settings.region_name}"
}