resource "aws_instance" "terraform_instance" {
    ami = "ami-005f9685cb30f234b"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform_vm"
    }
} 

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc_terra"
    }
} 

resource "aws_subnet" "my_subnet" {
    vpc_id                = aws_vpc.my_vpc.id 
        cidr_block        = "10.0.1.0/24"
        availability_zone = "us-east-1a"

        tags = {
        Name = "terra_subnet"
       }
}

resource "aws_s3_bucket" "test_bucket" {
    bucket = "my_test"
    acl = "private"
    versioning {
        enabled = true
    }
}