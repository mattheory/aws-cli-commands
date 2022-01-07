aws kms encrypt --key-id <YOUR-KEY-ID-HERE> --plaintext fileb://secret.txt --output text --query CiphertextBlob | base64 --decode > encryptedsecret.txt

aws kms decrypt --ciphertext-blob fileb://encryptedsecret.txt --output text --query Plaintext | base64 --decode > decryptedsecret.txt

aws kms re-encrypt --destination-key-id <YOUR-KEY-ID-HERE> --ciphertext-blob fileb://encryptedsecret.txt | base64 > newencryption.txt #way to rotate key with a new CMK

aws kms enable-key-rotation --key-id <YOUR-KEY-ID-HERE> #aws will rotate your CMK on an annual basis

aws kms get-key-rotation-status --key-id <YOUR-KEY-ID-HERE> #show key rotation status

aws kms generate-data-key --key-id <YOUR-KEY-ID-HERE> --key-spec AES_256 #for encrypting anything above 4kB - because it avoids sending the data to KMS through the network
#Envelope encryption: KMS generates data-key, data-key encrypt the data, encrypted data-key stays alongside data and is later decrypted by KMS to allow decrypting the data
