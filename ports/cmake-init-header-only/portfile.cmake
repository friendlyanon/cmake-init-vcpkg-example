set(VCPKG_BUILD_TYPE release)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-header-only
    REF master
    SHA512 0cd707414775053a153e862df57fadf5e0b1183ce1a0f79ef104f08eaac2a94f67e7b142bdeca95c8f8ac7bb1eaeab6222c6b2e7c96c240f5fe5793f7a0222b9
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
