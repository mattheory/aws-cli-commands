#!/bin/bash
yum update -y
yum install -y amazon-efs-utils
mkdir /mnt/efs/
mount -t efs -o tls fs-05f2252940eeae14f:/ /mnt/efs/ #replace fs-05f2252940eeae14f by the efs you created
