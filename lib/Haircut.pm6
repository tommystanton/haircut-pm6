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
        my $months   = 2;
        my $weeks    = 2;
        my $next-cut = $.last-cut.later(:$months)
                                 .later(:$weeks);

        my $summary = chomp sprintf q:to/END/,
            Today is %s.
            Your last cut was on %s.
            It has been %d day(s).

            Perhaps your next cut should be on %s?
            (That would be %d months and %d weeks from the last cut; %d day(s) later.)
            END
            $.today, $.last-cut, ($.today - $.last-cut),
            $next-cut, $months, $weeks, ($next-cut - $.last-cut);

        return $summary;
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
