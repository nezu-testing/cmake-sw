cmake_minimum_required(VERSION 3.15)

project(sw-test VERSION 1.0.0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include(cmake/Steamworks.cmake)

add_subdirectory(src)
