#!/usr/bin/env perl6

sub MAIN($file1, $file2 ) {

    my $count = 0;

    my %arr1 = $file1.IO.words.lc.subst(/<-[\w\s*]>/, '', :g).words.Bag;

    my %arr2 = $file2.IO.words.lc.subst(/<-[\w\s*]>/, '', :g).words.Bag;
    
    my @common = (%arr1.keys, %arr2.keys).Bag.values;

    for @common -> $c {
        if $c > 1 {
            $count++;
        }
    }    

    put $count;
}
