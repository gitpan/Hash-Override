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
