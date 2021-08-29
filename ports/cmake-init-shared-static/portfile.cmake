vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-shared-static
    REF v0.20.6
    SHA512 45fd9a326677fe490e054941bdf7f0cc95d32b6c4679324c47717530f9547494ee1b5993a8b68fdabfa5892d44cf40741913d314ed5704442818a0dd92c4081d
    HEAD_REF master
)

set(name shared)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "${name}")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# No license to copy, we'll just write a dummy here
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "")
