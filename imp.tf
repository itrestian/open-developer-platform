resource "aws_security_group" "sfx_rds" {
  name        = "sfx_rds"
  description = "Allow DB Connection within VPC"
  vpc_id      = module.skyfoundry_network.vpc_id

  ingress {
    description = "TCP rds 5432"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [module.skyfoundry_network.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "name" : "internal security group"
    "dummy_secret" : "passsssssss"
  }
}
