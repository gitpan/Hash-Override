#!/usr/bin/env perl
#
# This file is part of Hash-Override
#
# This software is copyright (c) 2012 by Stefan Petrea.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use strict;
use warnings;
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
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
