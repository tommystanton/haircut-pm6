use v6;
use Test;

use lib 'lib';
use Haircut;

{
    my $haircut = Haircut.new(last => '20150701');

    isa-ok($haircut, Haircut);

    can-ok($haircut, 'last');
    can-ok($haircut, 'now');
}

{
    my $haircut = Haircut.new(
        last => '20150701',
        now  => '20150802',
    );

    is(
        $haircut.last,
        DateTime.new(year => 2015, month => 7, day => 1),
        '\'last\' attribute was coerced to DateTime'
    );

    is(
        $haircut.now,
        DateTime.new(year => 2015, month => 8, day => 2),
        '\'now\' attribute was coerced to DateTime'
    );
}

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
