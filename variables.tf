variable "aws_region" {
  type =  string
  default = "ap-southeast-2"
}

variable "ami_id" {
  type        = string
  default     = "ami-086918d8178bfe266" #RHEL9
  description = "The id of the machine image (AMI) to use for the server."

}

variable "instance_type" {
  type = string
  #default = "t2.micro"
  default = "t3.small"
}

variable "aws_key_pair_name" {
    type = string
    default = "djoo-demo-ec2-keypair"
}

variable "ec2_tags" {
  description = "Tags for EC2 instance"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "Dev"
    Owner = "djoo"
    Name = "tf-vault-client-ec2-RHEL9"
    Test_Tag = "HSO-demo"
  }
}
