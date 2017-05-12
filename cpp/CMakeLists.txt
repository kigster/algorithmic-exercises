cmake_minimum_required(VERSION 3.2)

add_subdirectory(test)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

add_subdirectory(src)

