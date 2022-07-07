#secure jupyter notebook server
jupyter notebook password
cd ~
mkdir ssl
cd ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem#

#start jupyter notebook server
jupyter notebook --certfile=~/ssl/mycert.pem --keyfile ~/ssl/mykey.key
