#!/bin/bash -x

echo "Installing java ..."
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get -y install openjdk-8-jdk

echo "Downloading application ..."
curl -O -L "https://github.com/Thoughtworks-SEA-Capability/Infrastructure-101-Pathway/raw/master/week1/hello-spring-boot-0.1.0.jar"

echo "Starting application ..."
java -jar hello-spring-boot-0.1.0.jar
