resource "aws_instance" "my_ec2_instance" {
    ami = var.ami_id
    instance_type = var.ec2_type
    key_name = var.key_name
    vpc_security_group_ids = [var.ec2_sg_id]
    tags = {
        Name = "terraform"
    }
}