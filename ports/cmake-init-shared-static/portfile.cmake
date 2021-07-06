vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-shared-static
    REF master
    SHA512 4691caa7b1c8c152df19b03aaaf6e4056d1b137eca30aeca18890b5ad1c93c117a07be3e99fd300d61bab97b06987549fd1e0c0c62d0379432d16d64c621066a
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
