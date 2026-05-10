output "vpc_id" {
  value = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id
}

output "internet_gateway_id" {
  value = data.aws_internet_gateway.Bootcamp-vpc-do-not-delete-igw.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.pranav_subnet.id,
    aws_subnet.pranav_subnet_2.id
  ]
}

output "pranav_public_rt_1_id" {
  value = aws_route_table.pranav_public_rt_1.id
}

output "pranav_public_rt_2_id" {
  value = aws_route_table.pranav_public_rt_2.id
}

output "public_subnet_map" {
  value = {
    public_subnet_1 = {
      subnet_id         = aws_subnet.pranav_subnet.id
      cidr_block        = aws_subnet.pranav_subnet.cidr_block
      availability_zone = aws_subnet.pranav_subnet.availability_zone
      route_table_id    = aws_route_table.pranav_public_rt_1.id
    }

    public_subnet_2 = {
      subnet_id         = aws_subnet.pranav_subnet_2.id
      cidr_block        = aws_subnet.pranav_subnet_2.cidr_block
      availability_zone = aws_subnet.pranav_subnet_2.availability_zone
      route_table_id    = aws_route_table.pranav_public_rt_2.id
    }
  }
}
