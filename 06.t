#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use Test::Deep;
use Hash::Override;
use List::AllUtils qw/max/;

my ($A,$B);
####################################################################################
#6). Complex data structures: Array overwriting where values of the array are hashes
####################################################################################


$A = {
  key1 => [ 
    { 
      k1 => 'v1', 
      k2 => 'v2',
    } ,
    { 
      k3 => 'v3', 
      k4 => 'v4',
    } 
  ],
  key2 => 'v1',
};


$B = {
  key1 => [
    { 
      k1 => 'X', 
      k2 => 'Y',
    } ,
    {
      k5 => 'v5', 
      k6 => 'v6',
    }
  ],
  key2 => 'v1',
};

Hash::Override::merge($A,$B);
cmp_deeply(
  $A,
  {
    key1 => [ 
      { 
        k1 => 'X', 
        k2 => 'Y',
      } ,
      { 
        k3 => 'v3', 
        k4 => 'v4',
      } 
    ],
    key2 => 'v1',
  },
  '6). Array complex overwriting'
);

done_testing;
