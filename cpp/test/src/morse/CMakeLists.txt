project(morseTests)
cmake_minimum_required(VERSION 3.2)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

add_library(morseTests morse_test.cpp)

target_link_libraries(morseTests gtest gtest_main)
target_link_libraries(morseTests morse)
