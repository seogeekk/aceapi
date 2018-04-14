#!/usr/bin/perl
#

use strict;

my $external_ip = $ARGV[0];


if (!$external_ip) {
	printf "Please provide an external ip";
    exit 1;
}

my $replace = quotemeta($external_ip);

`perl -i -ple "s/http\:/https\:/g"  /usr/pkg/aceapi/routes/handlers/*.js`;

`perl -i -ple "s/localhost\:80/$replace/g" /usr/pkg/aceapi/routes/handlers/*.js`;