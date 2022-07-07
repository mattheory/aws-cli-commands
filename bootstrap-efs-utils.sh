#!/bin/bash
yum update -y
yum install -y amazon-efs-utils
mkdir /mnt/efs/
mount -t efs -o tls fs-05f2252940eeae14f:/ /mnt/efs/ #replace fs-05f2252940eeae14f by the efs you created

#Warning: make sure you attach a security group to the efs that allows TCP to NFS port 2049 from sg of the ec2s you want to mount from
