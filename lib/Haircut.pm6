class Haircut {
    has DateTime $.last is required;
    has DateTime $.now;

    method new(:$last, :$now) {
        $last ~~ /(\d ** 4)(\d ** 2)(\d ** 2)/;
        my $year  = $0;
        my $month = $1;
        my $day   = $2;

        return self.bless(
            last => DateTime.new(:$year, :$month, :$day),
            now  => DateTime.now(timezone => 0)
                            .truncated-to('day'),
        );
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
