include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
add_executable(equilibriumTests equilibriumTest.cpp)

target_link_libraries(equilibriumTests gtest gtest_main)
target_link_libraries(equilibriumTests equilibrium)
