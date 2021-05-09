vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-shared-static
    REF master
    SHA512 8c7e807f9cf5e536f041f52e0e9eea566a6189f25d5a51e1a3955ac84380049840f546a3d3df3bd9af15599216095c5ca17a7fae58883331c2cc8d1108b73524
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
