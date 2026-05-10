
# Fetch Existing VPC and Nat Gateway Through Data Code Block
# 
# -----------------------------------
data "aws_vpc" "Bootcamp-vpc-do-not-delete-vpc" {
  id = "vpc-02358ddc1cb955bcd"
}

data "aws_internet_gateway" "Bootcamp-vpc-do-not-delete-igw" {
  internet_gateway_id = "igw-095a43d99a5ec72d6"
}

# -----------------------------------
# Create First Public Subnet in Existing VPC
# -----------------------------------
resource "aws_subnet" "pranav_subnet" {
  vpc_id                  = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id
  cidr_block              = "10.0.31.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name         = "Pranav-21-pub-subnet"
    Owner        = "pranav.pate@einfochips.com",
    Department   = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform    = "TRUE",
    BU           = "Intelligent Automation"
  }
}

# -----------------------------------
# Create Second Public Subnet in Existing VPC
# -----------------------------------

resource "aws_subnet" "pranav_subnet_2" {
  vpc_id                  = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id
  cidr_block              = "10.0.131.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name         = "Pranav-22-pub-subnet"
    Owner        = "pranav.pate@einfochips.com",
    Department   = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform    = "TRUE",
    BU           = "Intelligent Automation"
  }
}

# -----------------------------------
# Route Table for First Public Subnet
# -----------------------------------

resource "aws_route_table" "pranav_public_rt_1" {
  vpc_id = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id


  tags = {
    Name         = "Pranav_Public_Route_Table_1"
    Owner        = "pranav.pate@einfochips.com",
    Department   = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform    = "TRUE",
    BU           = "Intelligent Automation"
  }
}

# -----------------------------------
# Route Table for Second Public Subnet
# -----------------------------------

resource "aws_route_table" "pranav_public_rt_2" {
  vpc_id = data.aws_vpc.Bootcamp-vpc-do-not-delete-vpc.id

  tags = {
    Name         = "Pranav_Public_Route_Table_2"
    Owner        = "pranav.pate@einfochips.com",
    Department   = "PES",
    Project_Name = "EIC Internal - DevOps Bootcamp Training",
    Terraform    = "TRUE",
    BU           = "Intelligent Automation"
  }
}

# -----------------------------------
# Default Route to Internet Gateway for First Public Subnet
# -----------------------------------

resource "aws_route" "public_default_1" {
  route_table_id         = aws_route_table.pranav_public_rt_1.id
  destination_cidr_block = "0.0.0.0/0"

  gateway_id = data.aws_internet_gateway.Bootcamp-vpc-do-not-delete-igw.id
}

# -----------------------------------
# Default Route to Internet Gateway for Second Public Subnet
# -----------------------------------

resource "aws_route" "public_default_2" {
  route_table_id         = aws_route_table.pranav_public_rt_2.id
  destination_cidr_block = "0.0.0.0/0"

  gateway_id = data.aws_internet_gateway.Bootcamp-vpc-do-not-delete-igw.id
}

# -----------------------------------
# Associate Route Table with First Subnet
# -----------------------------------

resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.pranav_subnet.id
  route_table_id = aws_route_table.pranav_public_rt_1.id
}

# -----------------------------------
# Associate Route Table with Second Subnet
# -----------------------------------

resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.pranav_subnet_2.id
  route_table_id = aws_route_table.pranav_public_rt_2.id
}