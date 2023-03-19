resource "null_resource" remote_prov {
  connection {
    type = "ssh"
    host = var.ec2_public_ip
    user = var.ec2_user
    private_key = file(var.private_key)
    agent = false
  }

  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo yum install jq git -y",
        "echo 'This is remote-exec example' > remote-exec.txt"
    ]    
  }
}