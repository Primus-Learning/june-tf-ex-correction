resource "aws_instance" "nexus" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = file("nexus.sh")
  key_name      = aws_key_pair.nexus.key_name
  tags = {
    Name = local.name
  }

  depends_on = [
    aws_key_pair.nexus
  ]
}

resource "aws_key_pair" "nexus" {
  key_name   = "deployer-key"
  public_key = tls_private_key.nexus_key.public_key_openssh
}

resource "tls_private_key" "nexus_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "nexus_key" {
  content  = tls_private_key.nexus_key.private_key_openssh
  filename = "nexuskey.pem"
}

