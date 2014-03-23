#!/usr/bin/perl

use Net::Patricia;

$pt = new Net::Patricia;

@nets = split(":", shift(@ARGV));

foreach(@nets) {
    my($ad, $bl) = split(/\//);
    my @octs = split(/\./, $ad);
    
    my($fixd) = join(".",
		     $octs[0],
		     $octs[1] || "0", 
		     $octs[2] || "0", 
		     $octs[3] || "0") . "/" . ($bl || "32");

    $pt->add_string($fixd);
}

while(<>) {
    next unless (m/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/);
    next unless $pt->match_string( $1 );
    print;
}

