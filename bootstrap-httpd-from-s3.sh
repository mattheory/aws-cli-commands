#!/bin/bash
yum update -y #install all updates
yum install httpd -y #install Apache web server
systemctl start httpd #start the Apache web server
systemctl enable httpd #enable httpd auto-start after reboot
sudo aws s3 cp s3://<BUCKET-NAME>/ /var/www/html/ --recursive #copy website on server