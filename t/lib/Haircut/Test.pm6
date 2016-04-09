class Haircut::Test {
    sub remove-store-fixture is export {
        unlink('t/fixtures/haircut-store.txt');
    }

    sub generate-store-fixture is export {
        spurt(
            't/fixtures/haircut-store.txt',
            chomp(q:to/END/),
                2015-05-01
                2015-07-01
                END
        );
    }
}
