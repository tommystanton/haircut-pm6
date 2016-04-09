use v6;
use Test;

use lib 't/lib';
use Haircut::Test;

ok(generate-store-fixture(), 'Store fixture generated');

my $output = run(
    'bin/haircut',
    '--store-file=t/fixtures/haircut-store.txt',
    :out
).out.slurp-rest;

like(
    $output,
    rx:i/'last cut was on 2015-07-01'/,
    'CLI output'
);

ok(remove-store-fixture(), 'Store fixture removed');

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
