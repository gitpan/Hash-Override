#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B);
##########################################################################
#5). Complex data structures: Array overwriting
##########################################################################

$A = {
  key1 => [ 1,2,3,4   ],
  key2 => 'v1',
};


$B = {
  key1 => [ 5,6 ],
  key2 => 'v1',
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  {
    key1 => [5,6,3,4],
    key2 => 'v1',
  },
  '5). Array overwriting'
);
done_testing;
