variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-f9dd458a"
    us-east-1 = "ami-6869aa05"
    us-west-1 = "ami-31490d51"
    us-west-2 = "ami-7172b611"
  }
}