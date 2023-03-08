#!/bin/bash
sudo su -
yum update -y
yum install git java-1.8.0-openjdk-devel.x86_64 maven awslogs -y
cd /
mkdir tom
cd tom/
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.zip
unzip apache-tomcat-9.0.71.zip
em -rm apache-tomcat-9.0.71.zip
chmod -R 744 apache-tomcat-9.0.71
./apache-tomcat-9.0.71/bin/startup.sh
cd apache-tomcat-9.0.71/webapps/
wget https://get.jenkins.io/war-stable/2.332.2/jenkins.war