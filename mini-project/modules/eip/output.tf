output "output_eip_public_ip" {
  value = aws_eip.lb.public_ip
}

output "output_eip_id" {
  value = aws_eip.lb.id
}