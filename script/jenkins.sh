#! /bin/bash

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo 
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key 
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo \"url=http://localhost:8080\" > url.txt
echo \"password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)\" > password.txt

