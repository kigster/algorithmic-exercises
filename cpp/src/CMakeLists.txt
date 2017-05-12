project(algos C CXX)

cmake_minimum_required(VERSION 3.2)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set(SOURCE_FILES main.cpp)

add_subdirectory(morse)
add_subdirectory(equilibrium)

include_directories(morse)
include_directories(equilibrium)

add_executable(algos ${SOURCE_FILES} )
target_link_libraries(algos equilibrium morse)
