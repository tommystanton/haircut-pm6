class Haircut {
    has DateTime $.last is required;
    has DateTime $.now;

    method new(:$last, :$now) {
        return self.bless(
            last => parse-datetime($last),
            now  => $now.defined ?? parse-datetime($now)
                                 !! DateTime.now(timezone => 0)
                                            .truncated-to('day'),
        );
    }

    sub parse-datetime(Str $ymd) returns DateTime {
        $ymd ~~ /(\d ** 4)(\d ** 2)(\d ** 2)/;
        my $year  = $0;
        my $month = $1;
        my $day   = $2;

        return DateTime.new(:$year, :$month, :$day);
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
