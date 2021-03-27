#Сервер який я буду використовувати в якості балансера нагрузки
resource "aws_instance" "my_ubuntu" {
  ami                    = "ami-013fffc873b1eaa1c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.secret.id]
  key_name               = aws_key_pair.deploy.key_name
  user_data              = file("nginx.sh")
  tags = {
    Name    = "load_balancer"
    Owner   = "Orest"
    project = "myfirst"
  }
  depends_on = [aws_instance.my_ubuntu2, aws_instance.my_ubuntu3]
}

#Веб сервер 1  (linux)
resource "aws_instance" "my_ubuntu2" {
  ami                    = "ami-013fffc873b1eaa1c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.secret.id]
  key_name               = aws_key_pair.deploy.key_name
  user_data              = file("web1.sh")
  tags = {
    Name    = "Web_2"
    Owner   = "Orest"
    project = "myfirst"
  }
}
#Веб сервер 2 (linux)
resource "aws_instance" "my_ubuntu3" {
  ami                    = "ami-013fffc873b1eaa1c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.secret.id]
  key_name               = aws_key_pair.deploy.key_name
  user_data              = file("web2.sh")
  tags = {
    Name    = "Web_1"
    Owner   = "Orest"
    project = "myfirst"
  }
}
