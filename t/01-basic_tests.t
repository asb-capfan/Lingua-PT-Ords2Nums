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
is(ord2num('s�timo'),7);
is(ord2num('oitavo'),8);
is(ord2num('nono'),9);

is(ord2num('d�cimo'),10);
is(ord2num('d�cimo primeiro'),11);

is(ord2num('trig�simo'),30);
is(ord2num('trig�simo terceiro'),33);
is(ord2num('septuag�simo'),70);

is(ord2num('cent�simo primeiro'),101);
is(ord2num('cent�simo quinquag�simo'),150);
is(ord2num('cent�simo nonag�simo nono'),199);

TODO: {

local $TODO = 'more tests needed';

is(ord2num('mil�simo primeiro'),1001);

}
