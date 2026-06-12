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
  vpc_id = aws_vpc.roboshop_vpc.id

  tags = local.igw_final_tags
}

# public subnet for us-east-1a, us-east-1b
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.roboshop_vpc.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.env}-public-${local.az_names[count.index]}"
        },
        var.public_subnet_tags
    )
}