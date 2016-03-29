use v6;
use Test;

use lib 'lib';
use Haircut;

{
    my $haircut = Haircut.new(last => '2015-07-01');

    isa-ok($haircut, Haircut);

    can-ok($haircut, 'last');
    can-ok($haircut, 'now');
}

{
    my $haircut = Haircut.new(
        last => '2015-07-01',
        now  => '2015-08-02',
    );

    cmp-ok(
        $haircut.last, '==', Date.new('2015-07-01'),
        '\'last\' attribute was coerced to Date'
    );

    cmp-ok(
        $haircut.now, '==', Date.new('2015-08-02'),
        '\'now\' attribute was coerced to Date'
    );
}

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
