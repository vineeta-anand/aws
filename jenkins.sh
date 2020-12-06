#!/bin/bash
# Jenkins install instructions for Ubuntu:
sudo apt-get update -y

#Install Java sdk
sudo apt-get install openjdk-8-jdk -y

#java version
java -version

readlink -f $(which java)
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
echo $JAVA_HOME
export JAVA_HOME
PATH=$PATH:$JAVA_HOME

# Get the keys for jenkins 
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y

# Install Jenkins
sudo apt-get install jenkins -y

sudo service jenkins start
sudo service jenkins status

# To use Jenkins: Open browser and type the http://<<Public Ip of the node on which you installed Jenkins>>:8080
# Then follow the instruction displayed on the browser.