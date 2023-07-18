FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get -y install python3 python3-pip python3-tk git
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install imageio[ffmpeg] imageio[pyav]

RUN mkdir /opt/instant_ngp
WORKDIR /opt/instant_ngp

RUN git clone --recurse-submodules https://github.com/ashawkey/torch-ngp.git
WORKDIR /opt/instant_ngp/torch-ngp

RUN pip3 install -r requirements.txt

RUN apt-get -y install wget
RUN wget https://download.pytorch.org/models/alexnet-owt-7be5be79.pth
RUN mkdir /root/.cache/torch
RUN mkdir /root/.cache/torch/hub
RUN mkdir /root/.cache/torch/hub/checkpoints
RUN mv alexnet-owt-7be5be79.pth /root/.cache/torch/hub/checkpoints/
