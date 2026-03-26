module "network" {
  source = "./modules/network"
  component = var.components
  env       = "dev"

}