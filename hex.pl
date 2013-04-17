#!/usr/bin/perl -w

# Convert between decimal and hexadecimal in both directions.
# Handle signed and unsigned values.

if (scalar(@ARGV) != 1)
{
	die "USAGE: hex.pl 0xf|15\n";
}

my $value = $ARGV[0];

if ($value =~ /0x/)
{
    # hexadecimal -> decimal
    printf "%s -> \n", $value;

    my $u_32 = hex $value;
    
    printf "bin: %b\n", $u_32;

    if($u_32 > 0xffff)
    {
        # 32bit
        printf "u_32: %u\n", $u_32;
        printf "i_32: %d\n", $u_32;
        exit;
    }

    if($u_32 > 0xff)
    {
        # 16bit
        my $i_16 = $u_32;

        if (($i_16 & 0x8000) == 0x8000)
        {
            # 16bit signed
            $i_16 |= 0xffff0000;
        }

        printf "u_16: %u\n", $u_32;
        printf "i_16: %d\n", $i_16;
        exit;
    }

    # 8bit
    my $i_8 = $u_32;

    if (($i_8 & 0x80) == 0x80)
    {
        # 8bit signed
        $i_8 |= 0xffffff00;
    }

    printf "u_8: %u\n", $u_32;
    printf "i_8: %d\n", $i_8;
    printf "ascii: '%c'\n", $u_32;
    exit;
}

# decimal to hexadecimal
printf "%d -> 0x%x\n", $value, $value;
printf "bin: %b\n", $value;

if (($value >= 0) && ($value <= 0xff))
{
    printf "ascii: '%c'\n", $value;
}

