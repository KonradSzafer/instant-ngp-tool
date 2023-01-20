#!/bin/bash

FILE="$1"

echo "$FILE"
docker run -it -d --gpus all --rm --volume "$FILE":"$FILE" --name neural_object_representation_generator neural_object_representation_generator
docker exec -it neural_object_representation_generator python3 main_nerf.py "$FILE" --workspace trial_nerf -O
docker cp neural_object_representation_generator:/opt/neural_object_representation_generator/torch-ngp/trial_nerf/results .
docker cp neural_object_representation_generator:/opt/neural_object_representation_generator/torch-ngp/trial_nerf/meshes .
docker stop neural_object_representation_generator
