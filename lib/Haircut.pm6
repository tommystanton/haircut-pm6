class Haircut {
    has Date $.last-cut is required;
    has Date $.today;

    method new(:$last-cut, :$today) {
        return self.bless(
            last-cut => Date.new($last-cut),
            today    => $today.defined ?? Date.new($today)
                                       !! Date.today,
        );
    }

    method text-summary returns Str {
        my $summary = chomp sprintf q:to/END/,
            Today is %s.
            Your last cut was on %s.
            It has been %d day(s).
            END
            $.today, $.last-cut, ($.today - $.last-cut);

        return $summary;
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
