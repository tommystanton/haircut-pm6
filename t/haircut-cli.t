use v6;
use Test;

my $output = run(
    'bin/haircut',
    '--last-cut=2015-07-01',
    :out
).out.slurp-rest;

like(
    $output,
    rx:i/^'2015-07-01 -->'/,
    'CLI output'
);

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
