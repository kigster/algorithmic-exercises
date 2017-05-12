project(algos C CXX)
cmake_minimum_required(VERSION 3.2)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set(SOURCE_FILES main.cpp)
add_executable(algos ${SOURCE_FILES} )

include_directories(src/morse)
include_directories(src/equilibrium)
add_subdirectory(src)
add_subdirectory(test)

target_link_libraries(algos equilibrium morse)
