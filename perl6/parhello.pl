#!/usr/bin/env perl6

sub MAIN {
  my @message = "Hello World!\n".split('');
  my @promises;

  for (@message) {
    my $promise = start {
      print $_;
    }

    @promises.push($promise);
  };

  for (@promises) {
    $_.result;
  }
}
