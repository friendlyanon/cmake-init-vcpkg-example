if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/vcpkg-example CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(
    TARGETS vcpkg-example_vcpkg-example
    EXPORT vcpkg-exampleTargets
    RUNTIME COMPONENT vcpkg-example_Runtime
)

write_basic_package_version_file(
    vcpkg-exampleConfigVersion.cmake
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    vcpkg-example_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/vcpkg-example"
    CACHE STRING "CMake package config location relative to the install prefix"
)
mark_as_advanced(vcpkg-example_INSTALL_CMAKEDIR)

install(
    FILES
    "${PROJECT_SOURCE_DIR}/cmake/vcpkg-exampleConfig.cmake"
    "${PROJECT_BINARY_DIR}/vcpkg-exampleConfigVersion.cmake"
    DESTINATION "${vcpkg-example_INSTALL_CMAKEDIR}"
    COMPONENT vcpkg-example_Development
)

install(
    EXPORT vcpkg-exampleTargets
    NAMESPACE vcpkg-example::
    DESTINATION "${vcpkg-example_INSTALL_CMAKEDIR}"
    COMPONENT vcpkg-example_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
