#!/usr/bin/env perl6

sub MAIN(Str $file, :$threshold=0.3) {
    die "Not a file $file" unless $file.IO.f;


    for $file.IO.lines.map(*.lc) -> $line {
        if $line.grep(/<[>]>/) { next; }

        my ($gc, $all) = 0,0;

        for $line.comb {
            when 'g' | 'c' { $gc++ }
        }

        $all = $line.chars;

        $gc/$all >= $threshold ?? \
                   (printf "%.2f: burkholderia\n", $gc/$all) !! (printf "%.2f: anthrax\n", $gc/$all);

    }

}
