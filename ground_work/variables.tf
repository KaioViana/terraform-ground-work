// arquivo para armazenamento de variaveis via terraform

variable "vpc_cidr_block" {
  description = "Range of IPv4 address for the VPC."
  default     = "172.17.0.0/16"
}

variable "az_count" {
  description = "Qtd of availability zones"
  default     = 2
}
