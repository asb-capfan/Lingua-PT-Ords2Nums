package Lingua::PT::Ords2Nums;

use 5.008;
use strict;
use warnings;

use Lingua::PT::Words2Nums;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	ord2num isord
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	ord2num isord
);

our $VERSION = '0.02';

my %values;

=head1 NAME

Lingua::PT::Ords2Nums - Converts Portuguese ordinals to numbers

=head1 SYNOPSIS

  use Lingua::PT::Ords2Nums;

  $num = word2num('décimo primeiro')   # 11

=cut

BEGIN {
  %values = (
    'bilionésimo'	=> 1000000000,
    'milionésimo'	=> 1000000,
    'milésimo'		=> 1000,

    'nongentésimo'	=> 900,
    'octigentésimo'	=> 800,
    'septigentésimo'	=> 700,
    'seiscentésimo'	=> 600,
    'quingentésimo'	=> 500,
    'quadrigentésimo'	=> 400,
    'tricentésimo'	=> 300,
    'ducentésimo'	=> 200,
    'centésimo' 	=> 100,

    'nonagésimo'	=> 90,
    'octogésimo' 	=> 80,
    'septuagésimo' 	=> 70,
    'sexagésimo' 	=> 60,
    'quinquagésimo' 	=> 50,
    'quadragésimo' 	=> 40,
    'trigésimo' 	=> 30,
    'vigésimo' 		=> 20,
    'décimo' 		=> 10,

    nono		=> 9,
    oitavo		=> 8,
    'sétimo'		=> 7,
    sexto		=> 6,
    quinto		=> 5,
    quarto		=> 4,
    terceiro		=> 3,
    segundo		=> 2,
    primeiro		=> 1,

  );
}

sub ord2num {
  $_ = shift || return undef;
  my $result = 0;

  s/(.*)bilionésimos/$result += (word2num($1) * 1000000000)/e;
  s/(.*)milionésimos/$result += (word2num($1) * 1000000)/e;
  s/(.*)milésimos/$result += (word2num($1) * 1000)/e;

  for my $value (keys %values) {
    s/$value/$result += $values{$value}/e;
  }

  $result;
}

sub isord { return 1 }

1;
__END__

=head1 DESCRIPTION

Converts Portuguese ordinals to numbers. Works up to 999.999.999.999
('novecentos e noventa e nove bilionésimos novecentos e noventa e nove
milionésimos novecentos e noventa e nove milésimos nongentésimo nonagésimo
nono').

=head1 DEPENDENCIES

Lingua::PT::Words2Nums

=head1 SEE ALSO

Lingua::PT::Nums2Ords

=head1 AUTHOR

Jose Alves de Castro, E<lt>jac@localdomainE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Jose Alves de Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
