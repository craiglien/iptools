#!/usr/bin/perl

use Net::Patricia;

$pt = new Net::Patricia;

sub println {
    print ${$_[0]} . "\n";
}

while(<>) {
    s{\s*$}{};
    if(m/(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/) {
	my $a = $_;
	$pt->add_string($1 . "/32", \$a);
    }
}

$pt->climb( \&println );
