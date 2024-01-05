# Configure the AWS Provider
provider "aws" {
  region = "var.region"
}

# Create a VPC
resource "aws_vpc" "VPC1" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "main_vpc"
    
  }

}
resource "aws_instance" "test" {
  count         = 4    
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t3.micro"
  tags = {
    Name = "HelloWorld"
   "vpc_id "= aws_vpc.VPC1.id 
   subnet_id = aws_subnet.main.id
    
}

}
# creating a subnet 
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = var.subnet_cidr_block


  tags = {
    Name = "Main"
  }
}