variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "disk_size" {
  type    = number
  default = 2
}

variable "aws_common_tag" {
  type        = map(any)
  description = "Set aws tag"
  default = {
    Name : "ebs-awstraining"
  }
}
