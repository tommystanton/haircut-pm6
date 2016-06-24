use v6;
use Test;

use lib 'lib';
use Haircut;

use lib 't/lib';
use Haircut::Test;

ok(generate-store-fixture(), 'Store fixture generated');

subtest {
    my $haircut = Haircut.new: :store-file('t/fixtures/haircut-store.txt');

    isa-ok($haircut, Haircut);

    can-ok($haircut, 'today');
    can-ok($haircut, 'store-file');
    can-ok($haircut, 'last-cut');

    can-ok($haircut, 'add-cut');
    can-ok($haircut, 'text-summary');
}, 'Class, accessors, methods';

my $haircut = Haircut.new(
    store-file => 't/fixtures/haircut-store.txt',
    today      => Date.new('2015-08-02'),
);

is(
    $haircut.text-summary,
    chomp(q:to/END/),
        Today is 2015-08-02.
        Your last cut was on 2015-07-01.
        It has been 32 day(s).

        Perhaps your next cut should be on 2015-09-15?
        (That would be 2 months and 2 weeks from the last cut; 76 day(s) later.)
        END
    'Summary regarding haircuts'
);

$haircut.add-cut('2015-09-01');

is(
    't/fixtures/haircut-store.txt'.IO.lines[*-1],
    '2015-09-01',
    'New cut date was stored'
);

ok(remove-store-fixture(), 'Store fixture removed');

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
