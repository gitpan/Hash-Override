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
#3). Testing the leafs from $right go to $left on a complex data structure
#    ( For key2 in $A, the structure doesn't correspond with key2 in B so
#    key2 is preserved, but key4 will be replaced with the value in B)
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
  key2 => 'v2',
  key3 => 'v3',
  key4 => 'v4',
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  {
    key1 => 'v1',
    key2 => {
      key1 => 'v1',
      key2 => 'v2',
    },
    key3 => 'v3',
  },
  '3). Checking complex data structure I leafs'
);

done_testing;
