set(VCPKG_BUILD_TYPE release)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-header-only
    REF master
    SHA512 8f3b6c8cb1073a8b71561336eddc487bec40777b426bea8adbc6cb9b7040361587d2bf05e40ba3b07c7c8a9bf4a1f5015ad5b468a21596be981e50952344902b
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
