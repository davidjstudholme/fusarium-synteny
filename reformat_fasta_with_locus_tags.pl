#/bin/perl -w

use strict;
use warnings;

my $infile = shift or die "Usage: $0 <fasta filename>\n";

open(INFILE, "<$infile") or die $!;

while (<INFILE>) {
    chomp;
    if (m/>.*\[locus_tag=([\w\d]+)\]/) {
	warn "$1\n";
	print ">$1\n";
    } elsif (m/>.*\[protein_id=KNB10683.1([\w\d-]+)]/) {
	warn "$1\n";
        print ">$1\n";
    } else {
	print "$_\n";
    }
}
