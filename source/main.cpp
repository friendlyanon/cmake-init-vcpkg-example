#include <iostream>
#include <string>

#include <lib.h>

#include <shared/shared.hpp>

int main() {
  library lib;
  exported_class e;
  std::cout << "Name from header-only dependency: " << lib.name << '\n';
  std::cout << "Name from shared library dependency: " << e.name() << '\n';
  return 0;
}
