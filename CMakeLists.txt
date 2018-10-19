cmake_minimum_required(VERSION 2.8)

project(prometheus-cpp-example)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(prometheus-cpp REQUIRED)

add_executable(myapp main.cpp)
target_link_libraries(myapp prometheus-cpp::core prometheus-cpp::pull)

install(TARGETS myapp DESTINATION bin)
