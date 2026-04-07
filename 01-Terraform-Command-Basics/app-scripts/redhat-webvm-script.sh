#!bin/bash
#sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo chmod -R 777 /var/www/html
sudo echo "Our own VM - VM Hostname: $(hostname)" > /var/www/html/index.html
sudo mkdir /var/www/html/app1