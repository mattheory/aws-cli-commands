#create pool

aws cognito-identity create-identity-pool \
--identity-pool-name DynamoPool \
--allow-unauthenticated-identities \
--output json
       

#create a IAM role named "Cognito_DynamoPoolUnauth"

aws iam create-role --role-name Cognito_DynamoPoolUnauth --assume-role-policy-document file://myCognitoPolicy.json --output json


#grant the "Cognito_DynamoPoolUnauth" role read access to DynamoDB by attaching managed policy: AmazonDynamoDBReadOnlyAccess

aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess --role-name Cognito_DynamoPoolUnauth 


#get the IAM role Amazon Resource Name (ARN)

aws iam get-role --role-name Cognito_DynamoPoolUnauth --output json 


#add role to the Cognito Identity Pool. Replace the pool ID with your own pool ID and use the role ARN from the previous step

aws cognito-identity set-identity-pool-roles \
--identity-pool-id "us-east-1:xxxxxxxxxxxxxxxxxxxxxxxxxxxxx" \
--roles unauthenticated=arn:aws:iam::xxxxx:role/Cognito_DynamoPoolUnauthRole --output json


#double check it worked using:

aws cognito-identity get-identity-pool-roles  --identity-pool-id "us-east-1:xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


#now specify the Cognito credentials in our application - i.e. in the JavaScript section of our webpage!
#Replace the identity pool ID with your own and the role ARN with your own role ARN. 
#Add this snippet to index.html:

AWS.config.credentials = new AWS.CognitoIdentityCredentials({
IdentityPoolId: "us-east-1:xxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
RoleArn: "arn:aws:iam::xxxxx:role/Cognito_DynamoPoolUnauthRole"
});