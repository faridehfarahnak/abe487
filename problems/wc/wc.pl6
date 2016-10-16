#!/usr/bin/env perl6

sub MAIN(Str $file ) {
    die "Not a file ($file)" unless $file.IO.f;

    printf "lines (%d) words (%d) chars (%d)\n", \
          $file.IO.lines.elems, $file.IO.words.elems, $file.IO.lines.join("\n").chars + 1;
}
