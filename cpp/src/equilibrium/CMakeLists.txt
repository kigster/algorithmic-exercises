project(equilibrium C CXX)
set(CMAKE_CXX_STANDARD 14)
cmake_minimum_required(VERSION 3.7)
set(SOURCE_FILES Equilibrium.cpp Equilibrium.h)

add_library(equilibrium ${SOURCE_FILES} )

install(TARGETS equilibrium DESTINATION lib)
install(FILES Equilibrium.h DESTINATION include)

