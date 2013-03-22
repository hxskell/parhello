#include <omp.h>
#include <iostream>
#include <string>
using namespace std;

int main() {
  string s = "Hello World!\n";
  int i;

# pragma omp parallel for
  for (i = 0; i < s.length(); i++) {
    cout << s[i];
  }

  return 0;
}
