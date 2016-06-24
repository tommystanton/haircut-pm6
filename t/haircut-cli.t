use v6;
use Test;

use lib 't/lib';
use Haircut::Test;

ok(generate-store-fixture(), 'Store fixture generated');

{
    my $output = run(
        'bin/haircut',
        "--store-file=$store-fixture",
        'foobar',
        :err,
    ).err.slurp-rest;

    is(
        $output,
        "'foobar': no such action\n",
        'CLI output for invalid action'
    );
}

{
    my $output = run(
        'bin/haircut',
        "--store-file=$store-fixture",
        'summary',
        :out
    ).out.slurp-rest;

    like(
        $output,
        rx:i/'last cut was on 2015-07-01'/,
        'CLI output for \'summary\''
    );
}

{
    my $output = run(
        'bin/haircut',
        "--store-file=$store-fixture",
        'add',
        :err
    ).err.slurp-rest;

    is(
        $output,
        "'add': missing date\n",
        'CLI output for \'add\' (date missing)'
    );
}

{
    my $output = run(
        'bin/haircut',
        "--store-file=$store-fixture",
        'add', '2015-09-01',
        :out
    ).out.slurp-rest;

    is($output, "", 'CLI output for \'add\'');
}

ok(remove-store-fixture(), 'Store fixture removed');

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
