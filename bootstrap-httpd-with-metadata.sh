#!/bin/bash
sudo yum update -y #install all updates
sudo yum install httpd -y #install Apache web server
usermod -a -G apache ec2-user #add ec2-user to apache group
chown -R ec2-user:apache /var/www #change group ownership of /var/www and its contents to the apache group
chmod 2775 /var/www #change directory permissions of /var/www and subdirectories to add group write permissions
find /var/www -type d -exec sudo chmod 2775 {} \; #set the group ID on subdirectories created in the future
find /var/www -type f -exec sudo chmod 0664 {} \; #recursively change the permissions for files in the /var/www directory and its subdirectories to add group write permission
EC2_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo "<html><body><h1>This is icora web server $EC2_HOSTNAME</h1></body></html>" > /var/www/html/index.html #create index.html
systemctl start httpd #start the Apache web server
systemctl enable httpd #enable httpd auto-start after reboot
