resource "aws_key_pair" "deploy" {
  key_name   = "deployer-key"
  public_key = file("/home/orest/.ssh/id_rsa.pub")
}
