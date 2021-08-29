set(VCPKG_BUILD_TYPE release)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO friendlyanon/cmake-init-header-only
    REF v0.20.6
    SHA512 a1a7f9accfbf78e49e65930b0c231bdd4876993509b90b9b6520fc314cd3b7593ddaa2586566f9d41e5da326f91bc04eeb86ac685c79a33c4f2bec9453334b78
    HEAD_REF master
)

set(name headeronly)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()

# No license to copy, we'll just write a dummy here
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "")
