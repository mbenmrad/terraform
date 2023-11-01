data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "myec2" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = var.instance_type
  key_name          = "devops"
  availability_zone = var.AZ
  tags              = var.aws_common_tag
  security_groups   = ["${var.sg_name}"]
  
root_block_device {
  delete_on_termination = true
}

provisioner "local-exec" {
  command = "echo PUBLIC IP: ${var.public_ip} > infos_ec2.txt"
}

provisioner "remote-exec" {
  inline = [
    "sudo apt-get update",
    "sudo apt-get install -y nginx",
    "sudo systemctl start nginx"
  ]

  connection {
    type        = "ssh"
    user        = var.user
    private_key = file("/home/vagrant/code/mini-project/modules/ec2/devops.pem")
    host        = self.public_ip
  }
}
}
