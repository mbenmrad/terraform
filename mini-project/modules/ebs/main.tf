resource "aws_ebs_volume" "myebs" {
  availability_zone = var.AZ
  size              = var.disk_size
  tags              = var.aws_common_tag

}