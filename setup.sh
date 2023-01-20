#!/bin/bash

# Install nvidia container toolkit for gpu support
apt-get install -y nvidia-container-toolkit
systemctl restart docker

# Build docker image
docker build . -t neural_object_representation_generator

# Install packages which depend on GPU and commit changes
docker run -it -d --gpus all --rm --name temp_busy neural_object_representation_generator
docker exec -it temp_busy pip3 install git+https://github.com/NVlabs/tiny-cuda-nn/\#subdirectory=bindings/torch
docker exec -it temp_busy bash scripts/install_ext.sh
docker commit temp_busy neural_object_representation_generator
docker stop temp_busy

echo "Process finished!"