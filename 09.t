#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B,$R);
$A = {
  key1 => {
    k1 => 'v1',
    k2 => {
      c1 => [1,2,3],
      c2 => 'v1'
    }
  }
};

$B = {
  key1 => {
    k1 => [1,2],
    k2 => {
      c1 => [4,2,3],
      c2 => 'v2'
    }
  }
};

Hash::Override::merge($A,$B);

$R = {
  key1 => {
    k1 => 'v1',
    k2 => {
      c1 => [4,2,3],
      c2 => 'v2'
    }
  }
};

cmp_deeply(
  $A,
  $R,
  '9). Complex data structure III'
);


done_testing;
