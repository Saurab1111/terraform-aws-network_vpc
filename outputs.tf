output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "alb_public_subnet_ids" {
  description = "IDs of ALB public subnets."
  value       = aws_subnet.alb_public[*].id
}

output "web_private_subnet_ids" {
  description = "IDs of web private subnets."
  value       = aws_subnet.web_private[*].id
}

output "app_private_subnet_ids" {
  description = "IDs of app private subnets."
  value       = aws_subnet.app_private[*].id
}

output "db_private_subnet_ids" {
  description = "IDs of database private subnets."
  value       = aws_subnet.db_private[*].id
}
