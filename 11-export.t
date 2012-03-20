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

$A={};
$B={};

eval {
  merge_hash_override($A,$B);
};

ok($@ eq '',"Hash::Override exported merge_hash_override properly");

cmp_deeply(
  $A,
  {},
  'result of merge_hash_override was correct'
);

done_testing;
