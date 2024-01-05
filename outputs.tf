#Creating an output block for vpc
output vpc_id{
value = aws_vpc.VPC1.id 
}

#creating output block for subnet
output subnet_id{
value = aws_subnet.main 
}