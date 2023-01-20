# Run with command
# docker build . -t neural_object_representation_generator

FROM nvidia/cuda:11.7.0-devel-ubuntu20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get -y install python3 python3-pip python3-tk git
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install imageio[ffmpeg] imageio[pyav]

RUN cd /opt
RUN mkdir neural_object_representation_generator
RUN cd neural_object_representation_generator

WORKDIR /opt/neural_object_representation_generator

RUN git clone --recurse-submodules https://github.com/ashawkey/torch-ngp.git
WORKDIR /opt/neural_object_representation_generator/torch-ngp

RUN pip3 install -r requirements.txt
