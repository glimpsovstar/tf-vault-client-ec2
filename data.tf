data "terraform_remote_state" "aws_dev_vpc" {
  backend = "remote"
  config = {
    organization = "djoo-hashicorp"
    workspaces = {
      name = "hcp-vault-demo-hvn-tgw"
    }
  }
}