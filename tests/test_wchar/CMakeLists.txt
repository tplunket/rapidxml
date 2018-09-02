project(test_wchar LANGUAGES CXX)
add_executable(test_wchar main.cpp)
add_test(NAME test_wchar
    COMMAND test_wchar
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
