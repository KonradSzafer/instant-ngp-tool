#!/bin/bash

# download example data
git clone https://github.com/NVlabs/instant-ngp
mkdir -p example_data
cp -r instant-ngp/data/nerf/fox example_data/
cp -r instant-ngp/data/sdf/armadillo.obj example_data/
rm -drf instant-ngp

# train nerf
DATA_PATH="$(pwd)/example_data/fox"
bash run.sh nerf $DATA_PATH

# train sdf
DATA_PATH="$(pwd)/example_data/armadillo.obj"
bash run.sh sdf $DATA_PATH
