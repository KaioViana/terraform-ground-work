// recurso aws_subnet

resource "aws_subnet" "private" {
  count             = var.az_count // o parâmetro count indica quantas vezes o recurso sera rodado. No caso, 2
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index) // pegando o bloco IPv4 da vpc
  availability_zone = data.aws_availability_zones.available.names[count.index] // data source, elementos disponiveis no provider
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "Private"
  }
}

resource "aws_subnet" "public" {
  count = var.az_count
  // var.az_count e usado para nao conflitar com o private
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, var.az_count + count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.main.id

  tags = {
    Name = "Public"
  }
}
