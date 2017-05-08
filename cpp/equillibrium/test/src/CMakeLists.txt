include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
add_executable(equilibriumTests finder_test.cpp helpers.h)

target_link_libraries(equilibriumTests gtest gtest_main)
target_link_libraries(equilibriumTests finder)
