FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
    g++ \
    libfftw3-dev \
    libopencv-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/brother_earth

COPY build/cross_light_images build/cross_light_images
COPY build/hough_circle_images build/hough_circle_images
COPY build/rotated_images build/rotated_images
COPY src src
COPY CMakeLists.txt .

RUN cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make

RUN rm -rf build/cross_light_images
RUN rm -rf build/hough_circle_images
RUN rm -rf build/rotated_images
RUN rm -rf src
RUN rm CMakeLists.txt
