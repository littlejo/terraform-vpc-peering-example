data "aws_vpc" "this" {
  tags = {
   "Name" = var.vpc_name
  }
}

data "aws_vpc" "peer" {
  tags = {
   "Name" = var.peer_vpc_name
  }
}


module "vpc-peering" {
  source  = "grem11n/vpc-peering/aws"
  version = "6.0.0"

  providers = {
    aws.this = aws
    aws.peer = aws
  }

  this_vpc_id = data.aws_vpc.this.id
  peer_vpc_id = data.aws_vpc.peer.id

  auto_accept_peering = true
}
