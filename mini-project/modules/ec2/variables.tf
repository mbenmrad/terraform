variable "instance_type" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "Set aws tag"
  default = {
    Name : "ec2-mradtraining"
  }
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "public_ip" {
  type    = string
  default = "NULL"
}

variable "sg_name" {
  type    = string
  default = "NULL"
}

variable "user" {
  type    = string
  default = "ubuntu"
}
