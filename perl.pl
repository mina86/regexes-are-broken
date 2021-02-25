#!/usr/bin/perl

use warnings;
use strict;

print(('foobarbaz' =~ /(foo|foobar)/) ? "$1 " : "-\n");
print(('foobarbaz' =~ /(foobar|foo)/) ? "$1 " : "-\n");
