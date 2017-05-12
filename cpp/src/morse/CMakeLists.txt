cmake_minimum_required(VERSION 3.2)
project(morse C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
set(SOURCE_FILES morse.cc morse.h)

add_library(morse ${SOURCE_FILES} )

install(TARGETS morse DESTINATION lib)
install(FILES morse.h DESTINATION include)
