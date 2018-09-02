project(test_multimodule LANGUAGES CXX)
add_executable(test_multimodule main1.cpp main2.cpp)
add_test(test_multimodule test_multimodule)
