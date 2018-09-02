project(test_non_comparative LANGUAGES CXX)
add_executable(test_non_comparative main.cpp)
add_test(NAME test_non_comparative
    COMMAND test_non_comparative
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
