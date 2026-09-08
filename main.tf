resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name        = var.name
    Environment = var.environment
  })
}

resource "aws_subnet" "alb_public" {
  count = length(var.alb_public_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.alb_public_subnets[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.name}-alb-public-${count.index + 1}"
    Tier = "alb-public"
  })
}

resource "aws_subnet" "web_private" {
  count = length(var.web_private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.web_private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, {
    Name = "${var.name}-web-private-${count.index + 1}"
    Tier = "web-private"
  })
}

resource "aws_subnet" "app_private" {
  count = length(var.app_private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.app_private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, {
    Name = "${var.name}-app-private-${count.index + 1}"
    Tier = "app-private"
  })
}

resource "aws_subnet" "db_private" {
  count = length(var.db_private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.db_private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(var.tags, {
    Name = "${var.name}-db-private-${count.index + 1}"
    Tier = "db-private"
  })
}
