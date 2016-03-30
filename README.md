# NAME

Haircut - See how long it's been since your last haircut

# SYNOPSIS

```text
use Haircut;

my $haircut = Haircut.new(last-cut => '2015-07-01');

say $haircut.text-summary;
```

...will output something like:

```text
Today is 2015-08-02.
Your last cut was on 2015-07-01.
It has been 32 day(s).

Perhaps your next cut should be on 2015-09-15?
(That would be 2 months and 2 weeks from the last cut; 76 day(s) later.)
```

# DESCRIPTION

Run this module via its CLI program, like so:

```text
$ perl6 bin/haircut --last-cut=2015-07-01
```

Try out the test suite, like so:

```text
$ prove --exec perl6
```

# PREREQUISITES

Perl 6 is supplied by Rakudo.

This software was developed with Rakudo __v6.c__, using the MoarVM
backend.

The `perl6` binary can be attained via
[rakudobrew](https://github.com/tadzik/rakudobrew), like so:

```text
$ rakudobrew build moar v6.c
```

Running the tests relies on `prove`, which is supplied by Perl 5's
App::Prove.

# AUTHOR

`Tommy Stanton <tommystanton@gmail.com>`
