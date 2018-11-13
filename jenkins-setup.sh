#!/bin/bash

sudo yum install -y wget vim git epel-release unzip
sudo yum clean all
sudo yum update -y
sudo yum install -y httpd openssl mod_ssl
sudo systemctl start httpd
sudo systemctl enable httpd

sudo yum install -y java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

#aws cli
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
python get-pip.py --user
pip install awscli --upgrade --user
sudo pip install awscli --upgrade

sudo sh -c "echo \"jenkins    ALL = NOPASSWD: /var/lib/jenkins/scripts/*\" >> /etc/sudoers"

sudo sed -i s/SELINUX=enforcing/SELINUX=permissive/g /etc/selinux/config
sudo setenforce 0

sudo systemctl restart httpd

echo "export BUCKET_NAME=$BUCKET_NAME" | sudo tee -a /etc/profile
sudo mkdir /scripts
sudo chmod 755 /scripts
