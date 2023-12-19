module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "mention-the-cluster-name"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true

    vpc_id = module.NCUK-vpc-preprod.vpc_id
    subnet_ids = module.NCUK-vpc-preprod.private_subnets

    tags = {
        environment = "pre-prod"
        application = "NCUK-preprod"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2

            NCUK-instance-type-preprods = ["t2.medium"]
        }
    }
}
