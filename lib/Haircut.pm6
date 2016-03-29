class Haircut {
    has Date $.last is required;
    has Date $.now;

    method new(:$last, :$now) {
        return self.bless(
            last => Date.new($last),
            now  => $now.defined ?? Date.new($now)
                                 !! Date.today,
        );
    }
}

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
