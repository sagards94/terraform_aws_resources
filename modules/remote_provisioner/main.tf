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
         "chmod +x /home/ec2-user/jenkins.sh",
         "bash /home/ec2-user/jenkins.sh"  
    ]    
  }
}