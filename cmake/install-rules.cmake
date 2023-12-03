install(
    TARGETS vcpkg-example_exe
    RUNTIME COMPONENT vcpkg-example_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
