project(morse C CXX)
set(CMAKE_CXX_STANDARD 14)
cmake_minimum_required(VERSION 3.7)
set(SOURCE_FILES Morse.cpp Morse.h)

add_library(morse ${SOURCE_FILES} )

install(TARGETS morse DESTINATION lib)
install(FILES morse.h DESTINATION include)
