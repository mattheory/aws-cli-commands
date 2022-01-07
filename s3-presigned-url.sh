aws s3 mb s3://<YOUR-BUCKET-NAME> #make bucket
echo "Hello Cloud Gurus" > hello.txt #create file hello.txt
aws s3 cp hello.txt s3://<YOUR-BUCKET-NAME> #upload file to s3 bucket
aws s3 ls s3://<YOUR-BUCKET-NAME> #check that file is in s3 bucket
aws s3 presign s3://<YOUR-BUCKET-NAME>/hello.txt --expires-in 300 #presign file with TTL of 300s = 5min
aws s3 rb s3://<YOUR-BUCKET-NAME> --force #remove_bucket