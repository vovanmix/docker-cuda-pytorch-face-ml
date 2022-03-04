FROM nvidia/cuda:11.4.2-cudnn8-devel-ubuntu18.04

# in amazon linux: "sudo yum -y install python3-tkinter", in debian: "apt-get install python3-tk"
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -qqy install python3-pip ffmpeg git less nano libsm6 libxext6 libxrender-dev ffmpeg python3-tk \
 && rm -rf /var/lib/apt/lists/*
#RUN apt-get update
#RUN #apt-get install ffmpeg -y
#RUN apt-get -qqy install ffmpeg git less nano libsm6 libxext6 libxrender-dev gfortran libopenblas-dev liblapack-dev -y \
# && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install cmake
RUN #pip3 install --ignore-installed Cython
RUN pip3 install --ignore-installed \
  git+https://github.com/1adrianb/face-alignment

RUN pip3 install --ignore-installed -r requirements.txt
RUN pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html


# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-gpu.html
# When you build a container image that does not use the NVIDIA/CUDA base images, you must set the NVIDIA_DRIVER_CAPABILITIES
#ENV NVIDIA_VISIBLE_DEVICES all
#ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
#ENV NVIDIA_REQUIRE_CUDA "cuda>=8.0"
