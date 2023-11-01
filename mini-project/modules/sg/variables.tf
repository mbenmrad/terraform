variable "aws_common_tag" {
  type        = map(any)
  description = "Set aws tag"
  default = {
    Name : "sg-awstraining"
  }
}

variable "name_sg" {
   type        = string
  description = "set sg name"
  default     = "sg_training"
}