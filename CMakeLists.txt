cmake_minimum_required(VERSION 3.14)

include(cmake/in-source-guard.cmake)

project(
    vcpkg-example
    VERSION 0.1.0
    DESCRIPTION "cmake-init generated executable project with vcpkg integration"
    HOMEPAGE_URL "https://github.com/friendlyanon/cmake-init-vcpkg-example"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(vcpkg-example_lib OBJECT source/lib.cpp)

target_include_directories(
    vcpkg-example_lib ${vcpkg-example_warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_compile_features(vcpkg-example_lib PUBLIC cxx_std_17)

find_package(headeronly REQUIRED)

target_link_libraries(vcpkg-example_lib PRIVATE headeronly::headeronly)

# ---- Declare executable ----

add_executable(vcpkg-example_vcpkg-example source/main.cpp)
add_executable(vcpkg-example::vcpkg-example ALIAS vcpkg-example_vcpkg-example)

set_target_properties(
    vcpkg-example_vcpkg-example PROPERTIES
    OUTPUT_NAME vcpkg-example
    EXPORT_NAME vcpkg-example
)

target_compile_features(vcpkg-example_vcpkg-example PRIVATE cxx_std_17)

find_package(shared REQUIRED)

target_link_libraries(
    vcpkg-example_vcpkg-example
    PRIVATE
    vcpkg-example_lib
    shared::shared
)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT vcpkg-example_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of vcpkg-example"
  )
endif()

add_custom_target(
    run_exe
    COMMAND "$<TARGET_FILE:vcpkg-example_vcpkg-example>"
    VERBATIM
)
