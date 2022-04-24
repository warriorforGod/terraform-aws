output "vpc_id" {
  description = "ID of the EC2 instance"
  value       = aws_vpc.vpc_name.id
}

output "ARN" {
  description = "AWS Resource Name"
  value       = aws_vpc.vpc_name.arn
}

output "cidr_block" {
  description = "vpc CIDR block"
  value       = aws_vpc.vpc_name.cidr_block
}

output "default_network_acl_id" {
  description = "default network acl ID"
  value       = aws_vpc.vpc_name.default_network_acl_id
}

output "default_route_table_id" {
  description = "default route table ID"
  value       = aws_vpc.vpc_name.default_route_table_id
}

output "default_security_group_id" {
  description = "default security group ID"
  value       = aws_vpc.vpc_name.default_security_group_id
}

output "dhcp_options_id" {
  description = "default dhcp options ID"
  value       = aws_vpc.vpc_name.dhcp_options_id
}

output "enable_classiclink" {
  description = "enable classiclink value"
  value       = aws_vpc.vpc_name.enable_classiclink
}

output "enable_classiclink_dns_support" {
  description = "enable classiclink dns support value"
  value       = aws_vpc.vpc_name.enable_classiclink_dns_support
}

output "enable_dns_hostnames" {
  description = "enable dns hostnames value"
  value = aws_vpc.vpc_name.enable_dns_hostnames
}

output "enable_dns_support" {
  description = "enable dns support value"
  value = aws_vpc.vpc_name.enable_dns_support
}

output "instance_tenancy" {
  description = "instance tenancy"
  value = aws_vpc.vpc_name.instance_tenancy
}

output "ipv6_association_id" {
  description = "ipv6 assocation ID"
  value = aws_vpc.vpc_name.ipv6_association_id
}

output "ipv6_cidr_block" {
  description = "ipv6 CIDR block"
  value = aws_vpc.vpc_name.ipv6_cidr_block
}

output "main_route_table_id" {
  description = "main VPC route table ID"
  value = aws_vpc.vpc_name.main_route_table_id
}

output "owner_id" {
  description = "owner id"
  value = aws_vpc.vpc_name.owner_id
}

output "tags" {
  description = "tags"
  value = aws_vpc.vpc_name.tags
}

output "instance_id" {
  description = "Instance ID"
  value = aws_instance.instance_name.id
}

output "network_interface_id" {
  description = "Network INterface ID"
  value = aws_instance.instance_name.primary_network_interface_id
}

output "public_ip" {
  description = "Instance Public IP"
  value = aws_instance.instance_name.public_ip
}

output "private_ip" {
  description = "Instance Private IP"
  value = aws_instance.instance_name.private_ip
}

