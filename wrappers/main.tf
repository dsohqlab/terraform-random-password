module "wrapper" {
  source = "../"

  for_each = var.items

  keepers          = try(each.value.keepers, var.defaults.keepers, null)
  length           = try(each.value.length, var.defaults.length)
  lower            = try(each.value.lower, var.defaults.lower, true)
  min_lower        = try(each.value.min_lower, var.defaults.min_lower, 0)
  min_numeric      = try(each.value.min_numeric, var.defaults.min_numeric, 0)
  min_special      = try(each.value.min_special, var.defaults.min_special, 0)
  min_upper        = try(each.value.min_upper, var.defaults.min_upper, 0)
  numeric          = try(each.value.numeric, var.defaults.numeric, true)
  override_special = try(each.value.override_special, var.defaults.override_special, null)
  special          = try(each.value.special, var.defaults.special, true)
  upper            = try(each.value.upper, var.defaults.upper, true)
}
