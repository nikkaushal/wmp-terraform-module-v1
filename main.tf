module "network" {
  source = "./modules/network"
  for_each = var.components
  components = each.key
  env       = "dev"

}