data "aws_vpc" "this" {
  cidr_block = "10.1.0.0/16"
}

data "aws_vpc" "peer" {
  cidr_block = "10.2.0.0/16"
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
