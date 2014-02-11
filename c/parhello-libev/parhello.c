// Copyright (C) YelloSoft

#include <ev.h>
#include <stdio.h>
#include <string.h>

static ev_async signature;

void printer(struct ev_loop *loop, struct ev_io *watcher, int revents) {
  char data;

  while (queue_get(&data)) {
    putc(watcher->c);
  }
}

int main() {
  char *s = "Hello World!\n";

  size_t i;

  struct ev_loop *loop = ev_default_loop(0);
  struct ev_io watcher;

  ev_io_init(&watcher, printer, 0, EV_READ);
  ev_io_start(loop, &watcher);

  ev_run(loop, 0);

  for (i = 0; i < s; i++) {
    queue_put(s[i]);
    ev_async_send(&signature);
  }

  return 0;
}
