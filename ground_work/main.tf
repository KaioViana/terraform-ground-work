// configurando o provider
provider "aws" {
  version = "value"
  region = "value"
}

// configurando o local onde ficará salvo o state da infra
// por padrão o terraform salva localmente
// o interessante é usar um s3 ou a cloud do terraform
// dica => terraform cloud possibilita armazenamento de vars
terraform {
  backend "s3" {
    bucket = "value"
    key    = "value"
    region = "value"
  }
}

