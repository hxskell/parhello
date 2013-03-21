#include <iostream>
#include <string>
#include <vector>
#include <numeric>
#include <future>
using namespace std;

int main() {
  string message = "Hello World!\n";

  vector<int> range(message.length(), 0);
  iota(range.begin(), range.end(), 0);

  vector<future<void>> futures;

  for (auto i : range) {
    futures.emplace_back(
                         std::async(
                                    launch::async,
                                    [&]() { cout << message[i]; }
                                    )
                         );
  }

  return 0;
}
