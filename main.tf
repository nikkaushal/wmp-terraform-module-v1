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

module "dns" {
  source = "./modules/dns"
  for_each = var.components
  components = each.key
  env       = "dev"
  private_ip = module.instance[each.key].private_ip
}

 module "ansible" {
  source = "./modules/ansible"
  for_each = var.components
  components = each.key
  env       = "dev"
  public_ip = module.instance[each.key].public_ip
  depends_on = [ module.dns ]
}
