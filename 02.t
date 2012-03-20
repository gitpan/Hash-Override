#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B);
##########################################################################
#2). Testing the leafs from $right go to $left on a simple data structure
##########################################################################

$A = {
  key1 => 'v1',
  key2 => 'v2',
  key3 => 'v3',
};

$B = {
  key1 => 'v1',
  key2 => 'X',
  key3 => 'Y',
  key4 => 'v4',
};

Hash::Override::merge($A,$B);

ok(
  $A->{key2} eq 'X' && 
  $A->{key3} eq 'Y',
  '2). Checking simple data structure leafs'
);
done_testing;
