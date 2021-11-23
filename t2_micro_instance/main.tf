//definindo provider
provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "path/credentials"
  profile = "profile"
}

// criando instância
resource "aws_instance" "example" {
  ami = "ami"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.my_key.key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}

// gerando chave ssh
resource "aws_key_pair" "my_key" {
  key_name = "my-key"
  public_key = "${file("~/.ssh/id_ed25519.pub")}"
}

// configurando security_group
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Enable SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  } ]
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Enable egrass"
    from_port = 0
    to_port = 0
    protocol = -1
  } ]
}

// gerando saída do endereço para conexão
output "example_public_dns" {
  value = "${aws_instance.example.plubic_dns}"
}
