# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(vcpkg-exampleTests LANGUAGES CXX)

# ---- Dependencies ----

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(vcpkg-example_test source/vcpkg-example_test.cpp)
target_link_libraries(
    vcpkg-example_test PRIVATE
    vcpkg-example_lib
    Catch2::Catch2WithMain
)
target_compile_features(vcpkg-example_test PRIVATE cxx_std_17)

catch_discover_tests(vcpkg-example_test)

# ---- End-of-file commands ----

add_folders(Test)
