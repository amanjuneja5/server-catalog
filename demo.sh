#! /bin/bash
echo "Hello"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker ps
id
whoami
