#include <iostream>
#include <string>
#include <vector>
#include <numeric>
#include <algorithm>
#include <future>
using namespace std;

int main() {
  string message = "Hello World!\n";

  vector<int> range(message.length(), 0);
  iota(range.begin(), range.end(), 0);

  for_each(range.begin(), range.end(), [&](int i) {
      std::async(
                 launch::async,
                 [&]() {
                   cout << message[i];
                 }
                 );
    });

  return 0;
}
