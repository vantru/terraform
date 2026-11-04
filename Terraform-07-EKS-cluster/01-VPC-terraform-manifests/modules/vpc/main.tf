# Resource-1: VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(var.tags, {Name = "${var.aws_environment}-vpc"})
}
# Resource-2: Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(var.tags, {Name = "${var.aws_environment}-igw"})
}
# Resource-3: public subnets
resource "aws_subnet" "public" {
  for_each = { for idx, az in local.azs : az => local.public_subnets[idx] }
  vpc_id = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.aws_environment}-public-${each.key}" })

}
# Resource-4 Private subnets
resource "aws_subnet" "private" {
  for_each = { for idx, az in local.azs : az => local.private_subnets[idx] }
  vpc_id = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.aws_environment}-private-${each.key}" })
  
}
# Resource-5 Elatic IP for NAT Gateway
resource "aws_eip" "nat" {
  tags = merge(var.tags, { Name = "${var.aws_environment}-nat-eip"})
}
# Resource-6 NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id = values(aws_subnet.public)[0].id
  tags = merge(var.tags, { Name = "${var.aws_environment}-nat" })
  depends_on = [ aws_internet_gateway.igw ]
}
# Resource 7 public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.tags, { Name = "${var.aws_environment}-public-rt" })
}

# Resource 8: Public route table Associate to public subnets
resource "aws_route_table_association" "public-asso" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}

# Resource 9: private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = merge(var.tags, { Name = "${var.aws_environment}-private-rt" })
}
# Resouce 10: Private route table Associate to private subnets
resource "aws_route_table_association" "private-asso" {
  for_each = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rt.id
}