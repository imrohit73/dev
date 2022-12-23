#!/bin/bash
sudo su -
yum update -y
yum install git java-1.8.0-openjdk maven -y
cd /
mkdir tom
cd tom/
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.70/bin/apache-tomcat-9.0.70.zip
unzip apache-tomcat-9.0.70.zip
chmod -R 744 apache-tomcat-9.0.70
./apache-tomcat-9.0.70/bin/startup.sh
cd apache-tomcat-9.0.70/webapps/
wget https://get.jenkins.io/war-stable/2.332.2/jenkins.war