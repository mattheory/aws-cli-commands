#create facts table
#ReadCapacityUnits=5,WriteCapacityUnits=5 - small capacity

aws dynamodb create-table --table-name facts --attribute-definitions \
AttributeName=fact_id,AttributeType=N --key-schema \
AttributeName=fact_id,KeyType=HASH \
--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

#populate facts table
aws dynamodb batch-write-item --request-items file://items.json



