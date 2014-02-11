// Copyright (c) YelloSoft

#include <omp.h>
#include <stdio.h>
#include <string.h>

int main() {
  char* s = "Hello World!\n";

  size_t i;

#pragma omp parallel for
  for (i = 0; i < strlen(s); i++) {
    (void) putc(s[i], stdout);
  }

  return 0;
}
