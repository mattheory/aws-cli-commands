ssh-keygen -t rsa -b 4096 -N "" -f key_name #generate an RSA 4096-bit key pair

ssh-keygen -t ecdsa -b 521 -N "" -f key_name #generate an ECDSA 521-bit key-pair (ECDSA has bit sizes of 256, 384, and 521)

ssh-keygen -t ed25519 -N "" -f key_name #generate an ED25519 key pair