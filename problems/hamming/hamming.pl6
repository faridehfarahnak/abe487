#!/usr/bin/env perl6

sub MAIN (Str $s1!, Str $s2!) {

    my $hamm_dist = 0;

    loop (my $i = 0; $i < ($s1.chars < $s2.chars ?? $s1.chars !! $s2.chars); $i++) {
        if $s1.lc.comb[$i] !eq $s2.lc.comb[$i] { $hamm_dist++; }
    }

    my $diff = ($s1.chars - $s2.chars).abs;
    put $hamm_dist + $diff;
}
