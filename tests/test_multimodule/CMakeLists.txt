project(test_multimodule LANGUAGES CXX)
add_executable(test_multimodule main1.cpp main2.cpp)
add_test(NAME test_multimodule
    COMMAND test_multimodule
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
