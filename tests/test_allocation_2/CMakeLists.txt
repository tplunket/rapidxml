project(test_allocation_2 LANGUAGES CXX)
add_executable(test_allocation_2 main.cpp)
add_test(NAME test_allocation_2
    COMMAND test_allocation_2
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
