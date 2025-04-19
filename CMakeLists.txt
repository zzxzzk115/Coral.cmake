cmake_minimum_required(VERSION 3.20)

project(CoralCMake VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_EXAMPLES "Build examples?" ON)
option(BUILD_TESTS "Build tests?" ON)

add_definitions(-D_CRT_SECURE_NO_WARNINGS)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_definitions(DEBUG)
else()
    add_compile_definitions(NDEBUG)
endif()

add_subdirectory(Coral.Native)

if(BUILD_EXAMPLES)
    add_subdirectory(Example/Example.Native)
endif()

if(BUILD_TESTS)
    add_subdirectory(Tests/Testing.Native)
endif()