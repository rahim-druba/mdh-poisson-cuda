cmake_minimum_required(VERSION 2.8.11)
project(mdh_cuda_generator)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)
include_directories(include)

file(GLOB SOURCE_FILES src/*.cpp)

add_library(mdh_cuda_generator STATIC ${SOURCE_FILES})

# poisson kernel generator
add_executable(poisson src/poisson/poisson.cpp)
target_link_libraries(poisson mdh_cuda_generator)
