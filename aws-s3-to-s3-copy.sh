#ensure ec2 instance has role with S3 Full Access & KMS Full Access for transfer
aws s3 sync s3://source-bucket-name/subfolder/ s3://destination-bucket-name/subfolder/