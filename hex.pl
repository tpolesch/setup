#!/usr/bin/perl

use strict;
use warnings;

# Convert between decimal and hexadecimal in both directions.
# Handle signed and unsigned values.

my $usage = "USAGE: $0 [0x41 | 65 | A | \"A\" | 'A' ]\n";

if (scalar(@ARGV) != 1)
{
	die "$usage";
}

my $value = $ARGV[0];

if ($value =~ /^(0x[1234567890abcdefABCDEF]+)$/)
{
    $value = hex($1);
}
elsif ($value =~ /^([-0123456789]+)$/)
{
    $value = $1;
}
elsif ($value =~ /^(.)$/)
{
    $value = ord($1);
}
else
{
    die "ERROR: Could not interpret $value.\n$usage"
}

printf("HEX: 0x%x\n", $value);
printf("BIN: %b\n", $value);

my $U32 = ForceFormat('L', ($value & 0xffffffff));
my $I32 = ForceFormat('l', ($value & 0xffffffff));
my $U16 = ForceFormat('S', ($value & 0x0000ffff));
my $I16 = ForceFormat('s', ($value & 0x0000ffff));
my $U8  = ForceFormat('C', ($value & 0x000000ff));
my $I8  = ForceFormat('c', ($value & 0x000000ff));

if ($U32 & 0xffff0000)
{
    printf("U32: %u\n", $U32);
    printf("I32: %d\n", $I32);
}
elsif ($U32 & 0xffffff00)
{
    printf("U16: %u\n", $U16);
    printf("I16: %d\n", $I16);
}
else
{
    printf("U8 : %u\n", $U8);
    printf("I8 : %d\n", $I8);
    printf("C8 : %c\n", $U8);
}

sub ForceFormat
{
    my $format = shift;
    my $value = shift;
    return unpack($format, pack($format, $value));
}

