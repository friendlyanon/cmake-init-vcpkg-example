vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-shared-static
    REF master
    SHA512 b3384ae3edd112ae49140b7890dc14430e9c59279708cee2a68f7e224c7818a2a8842408a0d3b19d7f9c05bba0031006143e4183651314e2d548c1c883329977
    HEAD_REF master
)

set(name shared)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    "-D${name}_INSTALL_CMAKEDIR=share/${name}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "${name}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# No license to copy, we'll just write a dummy here
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "")
