# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 20;
BEGIN { use_ok('Lingua::PT::Ords2Nums') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

is(ord2num('primeiro'),1);


is(ord2num('primeiro'),1);
is(ord2num('segundo'),2);
is(ord2num('terceiro'),3);
is(ord2num('quarto'),4);
is(ord2num('quinto'),5);
is(ord2num('sexto'),6);
is(ord2num('sétimo'),7);
is(ord2num('oitavo'),8);
is(ord2num('nono'),9);

is(ord2num('décimo'),10);
is(ord2num('décimo primeiro'),11);

is(ord2num('trigésimo'),30);
is(ord2num('trigésimo terceiro'),33);
is(ord2num('septuagésimo'),70);

is(ord2num('centésimo primeiro'),101);
is(ord2num('centésimo quinquagésimo'),150);
is(ord2num('centésimo nonagésimo nono'),199);

TODO: {

local $TODO = 'more tests needed';

is(ord2num('milésimo primeiro'),1001);

}
