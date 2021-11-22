// recurso aws_vpc
// configurção mínima aws via terraform

// composto pelo recurso que voce quer usar e o alias que voce quiser
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block // bloco ipv4 via variaveis
  enable_dns_hostnames = true

  tags = {
    Name = "value"
  }
}