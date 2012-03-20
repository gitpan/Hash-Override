#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

# this test is the dual of 05.t
my ($A,$B,$R);
$A = {
  key1 => [5,6]
};

$B = {
  key1 => [1,2,3,4]
};

$R = {
  key1 => [1,2,3,4]
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  $R,
  '10). Complex array  overwriting II'
);

done_testing;

