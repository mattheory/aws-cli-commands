#!/bin/bash
yum update -y #install all updates
yum install httpd -y #install Apache web server
echo "<html><body>This is matt's web server<h1>/h1</body></html>" > /var/ww/html/index.html #create index.html
systemctl start httpd #start the Apache web server
systemctl enable httpd #enable httpd auto-start after reboot
aws s3 mb s3://<YOUR-S3-BUCKET-NAME> #make s3 bucket
aws s3 cp index.html s3://<YOUR-S3-BUCKET-NAME> #save index.thml to s3 bucket