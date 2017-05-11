include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
add_executable(morseTest morseTest.cpp)

target_link_libraries(morseTest gtest gtest_main)
target_link_libraries(morseTest morse)
