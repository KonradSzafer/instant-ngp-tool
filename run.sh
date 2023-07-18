#!/bin/bash 
set -e

MODE="$1"
INPUT_FILES="$2"
echo $MODE

if [ "$MODE" == "nerf" ]; then
    echo "Running NERF"
    mkdir -p output/nerf
    docker run -it -d --gpus all --rm --volume "$INPUT_FILES":"$INPUT_FILES" --name instant_ngp_tool instant_ngp
    docker exec -it instant_ngp_tool python3 main_nerf.py "$INPUT_FILES" --workspace trial_nerf -O
    docker cp instant_ngp_tool:/opt/instant_ngp/torch-ngp/trial_nerf/results output/nerf/
    docker cp instant_ngp_tool:/opt/instant_ngp/torch-ngp/trial_nerf/meshes output/nerf/
#    docker stop instant_ngp_tool
elif [ "$MODE" == "sdf" ]; then
    echo "Running SDF"
    mkdir -p output/sdf
    docker run -it -d --gpus all --rm --volume "$INPUT_FILES":"$INPUT_FILES" --name instant_ngp_tool instant_ngp
    docker exec -it instant_ngp_tool python3 main_sdf.py "$INPUT_FILES" --workspace trial_sdf
    docker cp instant_ngp_tool:/opt/instant_ngp/torch-ngp/trial_sdf/results output/sdf/
    docker stop instant_ngp_tool
else
    echo "Please specify either 'nerf' or 'sdf'"
    exit 1
fi
