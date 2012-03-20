#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B);
###############################################################################################################
#8). Negative test for inexistent keys: If there's a key in B that's not in A then that will not be added to A
###############################################################################################################


$A = {
  key1 => 'v1',
};


$B = {
  key1 => 'v1',
  key2 => 'v2',
};

Hash::Override::merge($A,$B);
ok(!defined($A->{key2}),'8). Key that belongs to B but not A is not added to A.');

done_testing;
