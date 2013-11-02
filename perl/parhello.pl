#!/usr/bin/env perl
use strict;
use warnings;

use Parallel::ForkManager;

sub main {
  my @message = split(//, "Hello World!\n");

  my $manager = new Parallel::ForkManager;

  foreach my $c (@message) {
    $manager->start and next;
    print $c;
    $manager->finish;
  };
}

main unless caller;
