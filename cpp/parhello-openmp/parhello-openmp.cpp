// Copyright (C) YelloSoft

#include <omp.h>
#include <iostream>
#include <string>
using std::cout;
using std::string;

int main() {
  string s = "Hello World!\n";
  size_t i;

# pragma omp parallel for
  for (i = 0; i < s.length(); i++) {
    cout << s[i];
  }

  return 0;
}
