#!/bin/bash
yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1><font color="red">Welcome to NGINX!!  I am a student of devops-crash-course-spring-2021. I am number 38 in the devops-crash-course-spring-2021
It's a server 2  !!!!</h1>" | sudo tee /usr/share/nginx/html/index.html
