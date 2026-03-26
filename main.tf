module "network" {
  source = "./modules/network"
  for_each = var.components
  components = each.key
  env       = "dev"

}

module "instance" {
  source = "./modules/instance"
  for_each = var.components
  components = each.key
  env       = "dev"
  sg_id     = module.network[each.key].sg_id
}