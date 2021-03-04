FROM ubuntu:20.04

WORKDIR /blenderpy

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y install \
    build-essential \
    cmake \
    curl \
    git \
    libffi-dev \
    libssl-dev \
    libx11-dev \
    libxxf86vm-dev \
    libxcursor-dev \
    libxi-dev \
    libxrandr-dev \
    libxinerama-dev \
    libglew-dev \
    subversion \
    zlib1g-dev

ADD https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz Python-3.9.1.tgz
RUN tar xzf Python-3.9.1.tgz
RUN cd Python-3.9.1 && \
    ./configure 
RUN cd Python-3.9.1 && \
    make install

RUN git clone https://git.blender.org/blender.git

RUN mkdir lib
RUN cd lib && \
    svn checkout https://svn.blender.org/svnroot/bf-blender/trunk/lib/linux_centos7_x86_64

RUN cd blender && \
    make update
RUN cd blender && \
    make bpy
	
RUN cp /blenderpy/build_linux_bpy/bin/bpy.so /usr/local/lib/python3.9/site-packages
RUN mv /blenderpy/lib/linux_centos7_x86_64/python/lib/python3.9/site-packages/2.93 /usr/local/lib/python3.9/site-packages/