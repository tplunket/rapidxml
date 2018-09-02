project(test_invalid LANGUAGES CXX)
add_executable(test_invalid main.cpp)
add_test(NAME test_invalid
    COMMAND test_invalid
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
