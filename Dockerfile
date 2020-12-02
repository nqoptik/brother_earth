# Build stage
FROM ubuntu:focal AS build

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

# Production stage
FROM ubuntu:focal AS production

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    libfftw3-dev \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/brother_earth

COPY --from=build /root/brother_earth/build build

CMD [ "build/cross_light_detection" ]
