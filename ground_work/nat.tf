resource "aws_eip" "gw" {
  count = var.az_count
  vpc   = true

  tags = {
    Enviroment = "value"
  }
}

resource "aws_nat_gateway" "gw" {
  count         = var.az_count
  subnet_id     = element(aws_subnet.public.*.id, count.index) // faz uma iteração em uma lista
  allocation_id = element(aws_eip.gw.*.id, count.index)

  tags = {
    Enviroment = "value"
  }
}