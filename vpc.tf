module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-${var.environment}"
  cidr = "10.104.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.104.0.0/18", "10.104.64.0/18", "10.104.128.0/18"]
  public_subnets  = ["10.104.200.0/24", "10.104.202.0/24", "10.104.204.0/24"]

  enable_nat_gateway = true

  private_subnet_tags = {
   "kubernetes.io/role/internal-elb" = "1",
   "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "shared"
  }

  public_subnet_tags = {
   "kubernetes.io/cluster/${var.project_name}-${var.environment}" = "shared"
   "kubernetes.io/role/elb" = "1"
  }
  
  tags = {
    Terraform = "true"
    Environment = var.environment
    project_name = var.project_name
  }
}