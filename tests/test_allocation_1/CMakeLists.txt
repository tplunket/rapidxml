project(test_allocation_1 LANGUAGES CXX)
add_executable(test_allocation_1 main.cpp)
message(${CMAKE_CURRENT_SOURCE_DIR})
add_test(NAME test_allocation_1
    COMMAND test_allocation_1
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
