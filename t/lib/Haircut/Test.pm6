class Haircut::Test {
    our $store-fixture is export = 't/fixtures/haircut-store.txt';

    sub remove-store-fixture is export {
        unlink($store-fixture);
    }

    sub generate-store-fixture is export {
        spurt(
            $store-fixture,
            chomp(q:to/END/),
                2015-05-01
                2015-07-01
                END
        );
    }
}
