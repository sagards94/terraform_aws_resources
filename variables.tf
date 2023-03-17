variable "ec2_type" {
  type        = string
  default     = "t2.micro"
}


variable "ami_id" {
  type        = string
  default     = "ami-005f9685cb30f234b"
}


variable "key_name" {
    type = string
    default = "my_pem"
}

variable "key_path" {
    type = string
    default = "keys/my_pem.pem"
}


variable "sg_name" {
    type = string
    default = "my_sg"
}
