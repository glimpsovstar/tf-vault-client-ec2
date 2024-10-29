output "ec2_global_ips" {
  value = ["${aws_instance.rhel9_instance.*.public_ip}"]
}