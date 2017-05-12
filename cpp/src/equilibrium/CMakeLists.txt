cmake_minimum_required(VERSION 3.2)
project(equilibrium C CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set(SOURCE_FILES equilibrium.cpp equilibrium.h)

add_library(equilibrium ${SOURCE_FILES} )

install(TARGETS equilibrium DESTINATION lib)
install(FILES equilibrium.h DESTINATION include)

