cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(rapidxml_tests LANGUAGES CXX)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

enable_testing()

add_definitions(-DTIXML_USE_STL)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/..")

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_alignment")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_allocation_1")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_allocation_2")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_comparative")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_interface")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_invalid")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_multimodule")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_no_exceptions")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_nodes")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_non_comparative")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_size")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_speed")
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/test_wchar")
