project(algorithm_tests)
cmake_minimum_required(VERSION 3.2)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
include_directories(src/equilibrium src/morse)

add_subdirectory(lib/googletest)
add_subdirectory(src/morse)
add_subdirectory(src/equilibrium)

add_executable(tests main.cpp src/equilibrium/equilibrium_test.cpp src/morse/morse_test.cpp)
target_link_libraries(tests equilibrium morse equilibriumTests morseTests)

