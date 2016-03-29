# NAME

Haircut - See how long it's been since your last haircut

# SYNOPSIS

```text
use Haircut;

my $haircut = Haircut.new(last => '20150701');
```

# DESCRIPTION

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
