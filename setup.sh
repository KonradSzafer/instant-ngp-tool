#!/bin/bash

# Install nvidia container toolkit for gpu support
apt-get install -y nvidia-container-toolkit
systemctl restart docker

# Build docker image
docker build . -t instant_ngp

# Install packages which depend on GPU and commit changes
docker run -it -d --gpus all --rm --name temp_busy instant_ngp
docker exec -it temp_busy pip3 install git+https://github.com/NVlabs/tiny-cuda-nn/\#subdirectory=bindings/torch
docker exec -it temp_busy bash scripts/install_ext.sh
docker commit temp_busy instant_ngp
docker stop temp_busy

echo "Process finished!"
