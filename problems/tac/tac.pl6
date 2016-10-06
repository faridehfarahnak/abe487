#!/usr/bin/env perl6

sub MAIN( Str $file) {
	die "Not a File ($file)" unless $file.IO.f;
    put $file.IO.lines.reverse.join("\n")
}

