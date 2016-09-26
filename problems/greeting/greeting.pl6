#!/usr/bin/env perl6

sub MAIN ( Str $name!) {

	my $count = $name.chars;

	put "Hello, $name, your name has $count characters." 
}

