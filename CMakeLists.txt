cmake_minimum_required(VERSION 3.1)

project(brother_earth)

## Compile as C++11
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

## Compile with the highest warning level
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")

## System dependencies
find_package(OpenCV REQUIRED)
if(NOT ${OpenCV_VERSION} STRGREATER "2.4")
    message(FATAL_ERROR "OpenCV_VERSION has to > 2.4")
endif()

## Declare C++ executables
add_executable(cross_light_detection src/cross_light_detection.cpp)

add_executable(fast_hough_circle src/fast_hough_circle.cpp)

add_executable(orientation_fft src/orientation_fft.cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(cross_light_detection ${OpenCV_LIBS})

target_link_libraries(fast_hough_circle ${OpenCV_LIBS})

target_link_libraries(orientation_fft ${OpenCV_LIBS} fftw3)
