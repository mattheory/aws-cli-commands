#!/bin/bash
yum update -y #install all updates
yum install httpd -y #install Apache web server
yum install git -y #install git
echo "<html><body>This is matt's web server<h1>/h1</body></html>" > /var/ww/html/index.html #create index.html
systemctl start httpd #start the Apache web server
systemctl enable httpd #enable httpd auto-start after reboot
