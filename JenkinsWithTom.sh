#!/bin/bash
sudo su -
yum update -y
yum install git java-1.8.0-openjdk-devel.x86_64 maven awslogs -y
cd /
mkdir tom
cd tom/
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.zip
unzip apache-tomcat-9.0.73.zip
rm -rf apache-tomcat-9.0.73.zip
chmod -R 744 apache-tomcat-9.0.73
./apache-tomcat-9.0.73/bin/startup.sh
cd apache-tomcat-9.0.73/webapps/
wget https://updates.jenkins.io/download/war/2.343/jenkins.war
cd /
./tom/apache-tomcat-9.0.73/bin/startup.sh