use v6;
use Test;

use lib 'lib';
use Haircut;

subtest {
    my $haircut = Haircut.new(last => '2015-07-01');

    isa-ok($haircut, Haircut);

    can-ok($haircut, 'last');
    can-ok($haircut, 'now');

    can-ok($haircut, 'since-last-summary');
}, 'Class, accessors, methods' ;

my $haircut = Haircut.new(
    last => '2015-07-01',
    now  => '2015-08-02',
);

subtest {
    cmp-ok(
        $haircut.last, '==', Date.new('2015-07-01'),
        '\'last\' attribute was coerced'
    );

    cmp-ok(
        $haircut.now, '==', Date.new('2015-08-02'),
        '\'now\' attribute was coerced'
    );
}, 'Coercion to Date objects';

is(
    $haircut.since-last-summary,
    '2015-07-01 --> 2015-08-02: It has been 32 day(s).',
    'Summary of time elapsed since last haircut'
);

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
