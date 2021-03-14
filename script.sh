#!/bin/bash
sudo apt update
sudo apt -y install nginx
sudo systemctl enable nginx.service
sudo systemctl start nginx.service
instance=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
echo $instance > index.nginx-debian.html
sudo cp index.nginx-debian.html /var/www/html/index.nginx-debian.html
