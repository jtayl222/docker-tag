cmake_minimum_required(VERSION 3.15)
project(GitCommitApp VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Get git commit SHA if not provided
if(NOT DEFINED GIT_COMMIT_SHA)
    execute_process(
        COMMAND git rev-parse HEAD
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_COMMIT_SHA
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
    )
    if(NOT GIT_COMMIT_SHA)
        set(GIT_COMMIT_SHA "unknown")
    endif()
endif()

message(STATUS "Git Commit SHA: ${GIT_COMMIT_SHA}")

# Generate version header
configure_file(
    ${CMAKE_SOURCE_DIR}/version.h.in
    ${CMAKE_BINARY_DIR}/version.h
    @ONLY
)

add_executable(gitcommitapp main.cpp)
target_include_directories(gitcommitapp PRIVATE ${CMAKE_BINARY_DIR})
