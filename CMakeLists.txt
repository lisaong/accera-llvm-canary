cmake_minimum_required(VERSION 3.16)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/external/vcpkg/scripts/buildsystems/vcpkg.cmake
    CACHE STRING "vcpkg toolchain file")

project(Repro)

find_package(Catch2 CONFIG REQUIRED)

# These tests can use the Catch2-provided main
add_executable(tests src/test.cpp)
target_link_libraries(tests PRIVATE Catch2::Catch2 Catch2::Catch2WithMain)
