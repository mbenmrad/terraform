provider "aws" {
  region     = "us-east-1"
  access_key = "Your KEY"
  secret_key = "Your secret Key"
}

module "ebs" {
  source    = "../modules/ebs"
  disk_size = 5
}

module "eip" {
  source = "../modules/eip"
}

module "sg" {
  source = "../modules/sg"

}

module "ec2" {
  source        = "../modules/ec2"
  instance_type = "t2.micro"
  public_ip     = module.eip.output_eip_public_ip
  sg_name       = module.sg.output_sg_name
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.output_ec2_id
  allocation_id = module.eip.output_eip_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.output_id_volume
  instance_id = module.ec2.output_ec2_id
}

