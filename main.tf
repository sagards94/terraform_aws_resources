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


  # module "create_s3" {
  #   source = "./modules/create_s3"
  #   bucket_name = var.root_s3_backend_name
  # }

  
  # module "create_dynamodb" {
  #   source = "./modules/create_dynamodb"
  #   dynamodb_name = var.root_dynamodb_name
  #   hash_key = var.root_dynamodb_key
  # }
  

module "remote_provisioner" {
    source = "./modules/remote_provisioner"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    private_key = var.root_private_key
}

module "file_provisioner" {
    source = "./modules/file_provisioner"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address
    ec2_user = var.root_ec2_user
    private_key = var.root_private_key
    source_path = var.root_source_path
    destination_path = var.root_destination_path
}

module "local_provisioner" {
    source = "./modules/local_provisioner"
    ec2_public_ip = module.create_ec2.ec2_public_ip_address 
}


