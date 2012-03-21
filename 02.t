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
#2). Testing the leafs from $right go to $left on a simple data structure
##########################################################################

$A = {
  key1 => 'v1',
  key2 => 'v2',
  key3 => 'v3',
};

$B = {
  key1 => 'v1',
  key2 => 'X',
  key3 => 'Y',
  key4 => 'v4',
};

Hash::Override::merge($A,$B);

ok(
  $A->{key2} eq 'X' && 
  $A->{key3} eq 'Y',
  '2). Checking simple data structure leafs'
);
done_testing;
