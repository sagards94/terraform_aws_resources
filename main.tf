module "create_sg" {
  source = "./modules/create_sg"
  sg_name = var.root_sg_name
}


module "create_ec2" {
  source = "./modules/create_ec2"
  ami_id = var.root_ec2_ami
  ec2_type = var.root_ec2_type
  key_name = var.root_key_name
  ec2_sg_id = module.create_sg.sg_id
  }