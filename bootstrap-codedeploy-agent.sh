#!/bin/bash
sudo yum update -y
sudo yum install ruby -y
sudo yum install wget -y
cd /home/ec2-user
wget https://aws-codedeploy-ap-southeast-2.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status



#Create your application.zip and load it into CodeDeploy:
aws deploy create-application --application-name mywebapp
aws deploy push --application-name mywebapp --s3-location s3://<MY_BUCKET_NAME>/webapp.zip --ignore-hidden-files