#! /bin/bash
echo "Hello"
apt-get install update
groupadd docker
usermod -aG docker $USER
newgrp docker
docker ps
id
whoami
