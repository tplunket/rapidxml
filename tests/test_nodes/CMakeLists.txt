project(test_nodes LANGUAGES CXX)
add_executable(test_nodes main.cpp)
add_test(NAME test_nodes
    COMMAND test_nodes
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
