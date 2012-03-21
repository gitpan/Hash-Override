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

