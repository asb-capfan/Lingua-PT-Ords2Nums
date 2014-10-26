# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 50;
BEGIN { use_ok('Lingua::PT::Ords2Nums', 'ord2num') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

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
is(ord2num('ducent�simo nonag�simo nono'),299);
is(ord2num('tricent�simo primeiro'),301);
is(ord2num('quadrigent�simo vig�simo primeiro'),421);
is(ord2num('quingent�simo vig�simo'),520);
is(ord2num('seiscent�simo vig�simo segundo'),622);
is(ord2num('septigent�simo'),700);
is(ord2num('octigent�simo quinquag�simo quinto'),855);
is(ord2num('nongent�simo octog�simo oitavo'),988);

is(ord2num('mil�simo'),1000);
is(ord2num('dez mil�simos'),10000);
is(ord2num('onze mil�simos'),11000);
is(ord2num('dez mil�simos nonag�simo'),10090);
is(ord2num('cem mil�simos'),100000);
is(ord2num('trezentos mil�simos'),300000);
is(ord2num('trezentos e vinte e um mil�simos nongent�simo octog�simo s�timo'),321987);
is(ord2num('quatrocentos e quarenta e quatro mil�simos quadrigent�simo quadrag�simo quarto'),444444);
is(ord2num('novecentos e oitenta e sete mil�simos seiscent�simo quinquag�simo quarto'),987654);

is(ord2num('milion�simo'),1000000);
is(ord2num('milion�simo primeiro'),1000001);
is(ord2num('milion�simo mil�simo primeiro'),1001001);
is(ord2num('dois milion�simos'),2000000);
is(ord2num('novecentos e noventa e nove milion�simos novecentos e noventa e nove mil�simos nongent�simo nonag�simo nono'),999999999);

is(ord2num('bilion�simo'),1000000000);
is(ord2num('bilion�simo primeiro'),1000000001);
is(ord2num('dois bilion�simos'),2000000000);
is(ord2num('dois bilion�simos dois mil�simos'),2000002000);
is(ord2num('tr�s bilion�simos dois milion�simos mil�simo'),3002001000);
is(ord2num('tr�s bilion�simos dois milion�simos mil�simo nono'),3002001009);
is(ord2num('nove bilion�simos noventa milion�simos novecentos e nove mil�simos nonag�simo'),9090909090);
is(ord2num('oito bilion�simos oitocentos e oito milion�simos oitenta mil�simos octigent�simo oitavo'),8808080808);
is(ord2num('sete bilion�simos seiscentos e cinquenta e quatro milion�simos trezentos e vinte e um mil�simos nongent�simo octog�simo s�timo'),7654321987);
is(ord2num('novecentos e noventa e nove bilion�simos novecentos e noventa e nove milion�simos novecentos e noventa e nove mil�simos nongent�simo nonag�simo nono'),999999999999);
