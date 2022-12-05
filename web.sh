#!/bin/bash

#update instance

yum update -y

#install aapache server

sudo yum install httpd -y

#deploy web code

cd /
sudo mkdir webfiles
cd webfiles
wget https://www.tooplate.com/zip-templates/2121_wave_cafe.zip

unzip 2121_wave_cafe.zip
sudo cp -r ./2121_wave_cafe/* /var/www/html/

#start apache server

sudo service httpd start

sudo systemctl restart httpd