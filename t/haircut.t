use v6;
use Test;

use lib 'lib';
use Haircut;

subtest {
    my $haircut = Haircut.new(last-cut => '2015-07-01');

    isa-ok($haircut, Haircut);

    can-ok($haircut, 'last-cut');
    can-ok($haircut, 'today');

    can-ok($haircut, 'text-summary');
}, 'Class, accessors, methods' ;

my $haircut = Haircut.new(
    last-cut => '2015-07-01',
    today    => '2015-08-02',
);

subtest {
    cmp-ok(
        $haircut.last-cut, '==', Date.new('2015-07-01'),
        '\'last-cut\' attribute was coerced'
    );

    cmp-ok(
        $haircut.today, '==', Date.new('2015-08-02'),
        '\'today\' attribute was coerced'
    );
}, 'Coercion to Date objects';

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

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
