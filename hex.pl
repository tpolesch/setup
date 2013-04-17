#!/usr/bin/perl

use strict;
use warnings;

# Convert between decimal and hexadecimal in both directions.
# Handle signed and unsigned values.

if (scalar(@ARGV) != 1)
{
	die "USAGE: $0 0xf|15\n";
}

my $value = $ARGV[0];

if ($value =~ /^0x/)
{
    print("(hexadecimal input)\n");
    $value = hex($value);
}
elsif ($value =~ /^(\d+)/)
{
    print("(decimal input)\n");
    $value = $1;
}
else
{
    print("(character input)\n");
    $value = ord($value);
}

my $value32 = $value & 0xffffffff;
my $value16 = $value & 0xffff;
my $value08 = $value & 0xff;

printf("hex : %x\n", $value);
printf("dec : %d\n", $value);
printf("bin : %b\n", $value);
printf("u_32: %u\n", convert('L', $value32));
printf("i_32: %d\n", convert('l', $value32));
printf("u_16: %u\n", convert('S', $value16));
printf("i_16: %d\n", convert('s', $value16));
printf("u_8 : %u\n", convert('C', $value08));
printf("i_8 : %d\n", convert('c', $value08));
printf("c_8 : %s\n", chr($value08));

sub convert
{
    my $format = shift;
    my $value = shift;
    return unpack($format, pack($format, $value));
}

