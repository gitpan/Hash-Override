#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B);
####################################################################################
#7). Hashes containing undef values
####################################################################################

$A = {
  key1 => 'v1',
  key2 => 'v2',
};


$B = {
  key1 => 'v1',
  key2 => undef,
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  {
    key1 => 'v1',
    key2 => 'v2',
  },
  '7). A is unchanged after the merge'
);
done_testing;
