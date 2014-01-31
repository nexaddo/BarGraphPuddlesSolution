#!/usr/bin/perl -w
use strict;

sub main{
    my @graph = (2, 5, 1, 2, 3, 4, 7, 7, 6);
    
    print calculate_volume(\@graph);  
}

sub calculate_volume {
    my @graph = @{$_[0]};
    my $leftMax = 0;
    my $rightMax = 0;
    my $left = 0;
    my $right = scalar @graph - 1;
    my $volume = 0;

    while ($left < $right) {
        if ($graph[$left] > $leftMax) {
            $leftMax = $graph[$left];
        }
        if ($graph[$right] > $rightMax) {
            $rightMax = $graph[$right];
        }
        if ($leftMax >= $rightMax) {
            $volume += $rightMax - $graph[$right];
            $right--;
        }
        else{
            $volume += $leftMax - $graph[$left];
            $left++;
        }
    }
    return $volume;
}

&main();
