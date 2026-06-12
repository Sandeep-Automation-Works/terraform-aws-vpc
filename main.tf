resource "aws_vpc" "roboshop_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = merge(
    local.common_tags, 
    {
        Name = "${var.project}-${var.env}"
        
    }
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.igw_final_tags
}