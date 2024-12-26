
#include <iostream>
#include <ostream>

void foo() {}

struct MyStruct {

  int32_t foo{0};

  void do_something(std::string_view sv, std::string const &baz) {}

  std::string bar{};

private:
  void xyz() {}
};

int main() {

  std::cout << "Hello, world" << std::endl;
  MyStruct x{};

  std::string z = "test";

  char const cstr[] = "Hello";

  x.do_something(std::string_view(cstr), z);

  return 0;
}
