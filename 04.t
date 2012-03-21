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

my ($A,$B);
##########################################################################
#4). Testing the leafs from $right go to $left on a complex data structure
#    ( key1=>key3 will not be copied from B to A because A doesn't have a key1=>key3
#      key2=>key2 will stay the same in A
#      key2=>key2 will be taken from B, because it exists in B
#    )
##########################################################################
$A = {
  key1 => 'v1',
  key2 => {
    key1 => 'v1',
    key2 => 'v2',
  },
  key3 => 'v3',
};

$B = {
  key1 => 'v1',
  key2 => {
    key1 => 'X',
    key3 => 'Z',
  },
  key3 => 'v3',
  key4 => 'v4',
};

Hash::Override::merge($A,$B);

cmp_deeply(
  $A,
  {
    key1 => 'v1',
    key2 => {
      key1 => 'X',
      key2 => 'v2',
    },
    key3 => 'v3',
  },
  '4). Checking complex data structure II leafs'
);
done_testing;

