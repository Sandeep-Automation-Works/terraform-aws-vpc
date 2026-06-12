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