resource "aws_ssm_parameter" "aws_ssm_parameter_supplemental" {
  for_each    = { for parameter in var.supplemental_ssm_parameters : parameter.name => parameter }
  name        = "/${var.resource_name_prefix}/${each.key}"
  description = each.value.description
  type        = each.value.type
  value       = each.value.value
}
