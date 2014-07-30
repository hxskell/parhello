#!/usr/bin/env node

var
events = require("events");

var Printer = function(string) {
  this.string = string;
  this.length = string.length;
  this.fired = 0;
};

Printer.prototype = new events.EventEmitter();

Printer.prototype.print = function() {
  var self = this;

  for (var i in self.string) {
    var c = self.string[i];

    (function (c) {
      setInterval(
        function() {
          process.stdout.write(c);

          self.fired += 1;

          if (self.fired === self.length) {
            self.emit("end");
          }
        },
        Math.random() * 10 // ms
      );
    })(c);
  }
};

function main() {
  new Printer("Hello World!\n").on("end", function() {
    process.exit(0);
  }).print();

  process.stdin.resume();
  process.stdin.setEncoding("UTF8");

  process.stdin.on("data", function(chunk) {});

  process.stdin.on("end", function() {});
}

if (!module.parent) { main(); }
