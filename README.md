# Brother Earth project
A simple sense detector for the brother_earth project.

## Prerequisites
Install fftw3 library:
```
sudo apt-get install libfftw3-dev
```

## Build project
Build project with cmake:
```
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
```

## Run project
Run cross light detection:
```
./cross_light_detection
```

Run fast Hough circle detection:
```
./fast_hough_circle
```

Run orientation detection:
```
./orientation_fft
```
