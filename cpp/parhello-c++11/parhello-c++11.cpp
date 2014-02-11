// Copyright (C) YelloSoft

#include <future>
#include <iostream>
#include <string>
#include <vector>
#include <numeric>
using std::cout;
using std::string;
using std::vector;
using std::future;
using std::async;
using std::launch;

int main() {
  string message = "Hello World!\n";

  vector<int> range(message.length(), 0);
  iota(range.begin(), range.end(), 0);

  vector<future<void>> futures;

  for (auto i : range) {
    futures.emplace_back(
      std::async(launch::async, [&]() { cout << message[(size_t) i]; })
    );
  }

  return 0;
}
