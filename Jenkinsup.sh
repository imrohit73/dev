#!/bin/bash
sudo su -
yum update -y
yum install git java-1.8.0-openjdk maven -y
cd /
mkdir tom
cd tom/
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y
service jenkins start
systemctl enable jenkins