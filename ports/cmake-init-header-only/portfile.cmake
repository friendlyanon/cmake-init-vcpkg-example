set(VCPKG_BUILD_TYPE release)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-header-only
    REF master
    SHA512 5ec8b5221e3e06bc2b4ca72042827e2a81af7b7e6c01a464bf2e5ec62efa3c05832444171003771ae8c83cbd6188fa60aa75f88c19e98ebf6f813a6503d62d28
    HEAD_REF master
)

set(name headeronly)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
    "-D${name}_INSTALL_CMAKEDIR=share/${name}"
)

vcpkg_cmake_install()

# No license to copy, we'll just write a dummy here
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "")
