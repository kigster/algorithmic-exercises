project(finder C CXX)
set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES Finder.cpp Finder.h)

add_library(finder ${SOURCE_FILES} )

install(TARGETS finder DESTINATION lib)
install(FILES Finder.h DESTINATION include)
