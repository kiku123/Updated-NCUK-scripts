data "aws_NCUK-availability-zone-preprods" "azs" {}
module "NCUK-vpc-preprod" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = "NCUK-vpc-preprod"
  cidr            = var.NCUK-vpc-cidr-block-preprod
  private_subnets = var.private_NCUK-subnet-cidr-block-preprods
  public_subnets  = var.public_NCUK-subnet-cidr-block-preprods
  azs             = data.aws_NCUK-availability-zone-preprods.azs.names

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                  = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/myjenkins-server-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }
}
