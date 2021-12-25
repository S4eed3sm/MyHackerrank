cmake_minimum_required(VERSION 3.0.0)
project(plus_minus VERSION 0.1.0)
set(CMAKE_CXX_STANDARD 17)


include(CTest)
enable_testing()

add_executable(plus_minus main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
