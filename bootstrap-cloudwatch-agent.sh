#!/bin/bash
sudo yum install -y awslogs

#https://docs.aws.amazon.com/prescriptive-guidance/latest/implementing-logging-monitoring-cloudwatch/deploy-cloudwatch-agent-user-data-script.html

#AWS recommends using Systems Manager instead

#Edit the /etc/awslogs/awslogs.conf file to configure the logs to track -https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html

#By default, the /etc/awslogs/awscli.conf points to the us-east-1 Region. To push your logs to a different Region, edit the awscli.conf file and specify that Region.

sudo systemctl start awslogsd

#Check the /var/log/awslogs.log file for errors logged when starting the service.

sudo systemctl enable awslogsd.service

#You should see the newly created log group and log stream in the CloudWatch console after the agent has been running for a few moments.