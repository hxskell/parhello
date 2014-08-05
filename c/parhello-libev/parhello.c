// Copyright (C) YelloSoft

#include <ev.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "parhello.h"

typedef char queue;

extern bool queue_get(queue *q);
extern void queue_put(queue q);

void printer(
  struct ev_loop __attribute((unused)) *loop,
  struct ev_io __attribute__((unused)) *watcher,
  __attribute__((unused)) int revents
) {
  char data;

  while (queue_get(&data)) {
    putc(data, stdout);
  }
}

int main() {
  const char *s = "Hello World!\n";

  size_t i;

  struct ev_loop *loop = ev_default_loop(0);
  struct ev_io watcher;

  ev_io_init(&watcher, printer, 0, EV_READ);
  ev_io_start(loop, &watcher);

  ev_run(loop, 0);

  for (i = 0; i < (size_t) s; i++) {
    queue_put(s[i]);
    ev_async_send(&signature, &watcher);
  }

  return 0;
}
