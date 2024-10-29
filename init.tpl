#!/bin/bash
set -v
echo "beginning init"
echo "Registering the system to RHN"
sudo rhc connect -a djoo-test -o 18372743
sudo subscription-manager config --rhsm.manage_repos=1
sudo subscription-manager repos --enable rhel-9-for-x86_64-baseos-rpms
echo "Installing HTTPD"
sudo dnf install -y httpd
sudo systemctl enable httpd
sudo systemctl restart httpd
echo "Installing Vault Binary"
sudo dnf install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf -y install vault
sudo dnf update -y
echo "end init"