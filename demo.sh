#! /bin/bash
echo "Hello"
groupadd docker
usermod -aG docker $USER
newgrp docker
docker ps
id
whoami
