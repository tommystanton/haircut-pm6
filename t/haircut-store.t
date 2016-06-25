use v6;
use Test;

use lib 'lib';
use Haircut;

my $config-dir = 't/haircut_config';

ok(
    not $config-dir.IO.d,
    'Test directory does not initially exist'
);

my $haircut = Haircut.new(:$config-dir);
lives-ok(
    { $haircut.add-cut('2015-05-01') },
    'Directory for \'config-dir\' was created'
);

ok(
    (unlink($haircut.store-file) and rmdir($haircut.config-dir)),
    'Test directory removed'
);

done-testing;

# vim:syntax=perl6:softtabstop=4:shiftwidth=4
