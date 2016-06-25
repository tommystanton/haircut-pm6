class Haircut {
    has $.today;
    has $.config-dir;
    has $.store-file;

    submethod BUILD(:$!today, :$!config-dir, :$!store-file) {
        $!today      //= Date.today;
        $!config-dir //= "$*HOME/.haircut";
        $!store-file //= "$!config-dir/store.txt";

        mkdir($!config-dir) unless $!config-dir.IO.d;
    }

    method add-cut(Str $date) {
        spurt($!store-file, "$date\n", :append);
    }

    method text-summary returns Str {
        my $months   = 2;
        my $weeks    = 2;

        my @cuts     = $!store-file.IO.lines;
        my $last-cut = Date.new: @cuts[*-1];
        my $next-cut = $last-cut.later(:$months)
                                .later(:$weeks);

        my $summary = chomp sprintf q:to/END/,
            Today is %s.
            Your last cut was on %s.
            It has been %d day(s).

            Perhaps your next cut should be on %s?
            (That would be %d months and %d weeks from the last cut; %d day(s) later.)
            END
            $!today, $last-cut, ($!today - $last-cut),
            $next-cut, $months, $weeks, ($next-cut - $last-cut);

        return $summary;
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
