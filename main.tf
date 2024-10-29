resource "aws_instance" "rhel9_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.aws_dev_vpc.outputs.vpc-subnet-id
  key_name      = var.aws_key_pair_name
  tags          = var.ec2_tags
  vpc_security_group_ids = [data.terraform_remote_state.aws_dev_vpc.outputs.security-group-id] 
}

## TESTING with aws_ec2_instance_state ####
# As it is stated on: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_instance_state. ##
# "AWS does not currently have an EC2 API operation to determine an instance has finished processing user data. As a result, this resource can interfere with user data processing." ##
# For the demo purposes, I may choose to have the ec2 instance stopped, and for the demo purpose, I may want it to be up and runing.##
###########################################

resource "aws_ec2_instance_state" "rhel9_instance_state" {
  instance_id = aws_instance.rhel9_instance.id
  state = "running"
}

resource "aws_eip" "instance-eip" {
  instance = aws_instance.rhel9_instance.id
  vpc = true
}