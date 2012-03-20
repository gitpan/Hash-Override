#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;
use Storable qw/dclone/;


my ($A,$B);

######################################################
# 1). At the end of this test A will also take the key4
# from B, so A will have the contents of B at the end
######################################################


$A = {
  key1 => 'v1',
  key2 => 'v2',
  key3 => 'v3',
};
my $orig_A = dclone $A;
$B = {
  key1 => 'v1',
  key2 => 'v2',
  key3 => 'v3',
  key4 => 'v4',
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  $orig_A,
  '1).B differs from A in just one key added, so after running merge A==B'
);

done_testing;
