#!/bin/bash
sudo yum update -y
sudo yum install java-1.8.0-openjdk.x86_64 -y
cd /opt
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
tar -zxvf nexus-3.0.2-02-unix.tar.gz
mv /opt/nexus-3.0.2-02 /opt/nexus
sudo adduser nexus
sudo echo 'nexus   ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
sudo chown -R nexus:nexus /opt/nexus
sudo echo 'run_as_user="nexus"' > /opt/nexus/bin/nexus.rc
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo su - nexus
service nexus start