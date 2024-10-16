cmake_minimum_required(VERSION 3.15)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

project(dependency CXX)

add_library(dependency src/dependency.cpp)
target_include_directories(dependency PUBLIC include)

set_target_properties(dependency PROPERTIES PUBLIC_HEADER "include/dependency.h")
install(TARGETS dependency)
