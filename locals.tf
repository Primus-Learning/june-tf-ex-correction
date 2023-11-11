
locals {
  name       = "nexus"
  env        = var.environment
  team       = var.team
  common_tag = "${var.environment}-${var.team}"
}