package Lingua::PT::Ords2Nums;

use 5.006;
use strict;
use warnings;

use Lingua::PT::Words2Nums;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	ord2num
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '0.06';

my %values;

=head1 NAME

Lingua::PT::Ords2Nums - Converts Portuguese ordinals to numbers

=head1 SYNOPSIS

  use Lingua::PT::Ords2Nums qw/ord2num/;

  $num = word2num('d�cimo primeiro')   # 11

=head1 DESCRIPTION

Converts Portuguese ordinals to numbers. Works up to 999.999.999.999
('novecentos e noventa e nove bilion�simos novecentos e noventa e nove
milion�simos novecentos e noventa e nove mil�simos nongent�simo nonag�simo
nono').

=cut

BEGIN {
  %values = (
    'bilion�simo'	=> 1000000000,
    'milion�simo'	=> 1000000,
    'mil�simo'		=> 1000,

    'nongent�simo'	=> 900,
    'octigent�simo'	=> 800,
    'septigent�simo'	=> 700,
    'seiscent�simo'	=> 600,
    'quingent�simo'	=> 500,
    'quadrigent�simo'	=> 400,
    'tricent�simo'	=> 300,
    'ducent�simo'	=> 200,
    'cent�simo' 	=> 100,

    'nonag�simo'	=> 90,
    'octog�simo' 	=> 80,
    'septuag�simo' 	=> 70,
    'sexag�simo' 	=> 60,
    'quinquag�simo' 	=> 50,
    'quadrag�simo' 	=> 40,
    'trig�simo' 	=> 30,
    'vig�simo' 		=> 20,
    'd�cimo' 		=> 10,

    nono		=> 9,
    oitavo		=> 8,
    's�timo'		=> 7,
    sexto		=> 6,
    quinto		=> 5,
    quarto		=> 4,
    terceiro		=> 3,
    segundo		=> 2,
    primeiro		=> 1,

  );
}

=head2 ord2num

Turns an ordinal number into a regular number (decimal).

  $num = word2num('segundo')
  # $num now holds 2

=cut

sub ord2num {
  $_ = shift || return undef;
  my $result = 0;

  s/(.*)bilion�simos/$result += (word2num($1) * 1000000000)/e;
  s/(.*)milion�simos/$result += (word2num($1) * 1000000)/e;
  s/(.*)mil�simos/$result += (word2num($1) * 1000)/e;

  for my $value (keys %values) {
    s/$value/$result += $values{$value}/e;
  }

  $result;
}

1;
__END__

=head1 DEPENDENCIES

Lingua::PT::Words2Nums

=head1 TO DO

=over 6

=item * Implement function isord()

=back

=head1 SEE ALSO

More tools for the Portuguese language processing can be found at the
Natura project: http://natura.di.uminho.pt

=head1 AUTHOR

Jose Castro, C<< <cog@cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2004 Jose Castro, All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
