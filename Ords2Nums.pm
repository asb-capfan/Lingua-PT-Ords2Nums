package Lingua::PT::Ords2Nums;

use 5.008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	ord2num isord
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	ord2num isord
);

our $VERSION = '0.01';

my %values;

=head1 NAME

Lingua::PT::Ords2Nums - Converts Portuguese ordinals to numbers

=head1 SYNOPSIS

  use Lingua::PT::Ords2Nums;

  $num = word2num('d�cimo primeiro')   # 11

=cut

BEGIN {
  %values = (

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

sub ord2num {
  $_ = shift || return undef;
  my $result = 0;

  for my $value (keys %values) {
    s/$value/$result += $values{$value}/e;
  }

  $result;
}

sub isord { return 1 }

1;
__END__

=head1 DESCRIPTION

Converts Portuguese ordinals to numbers. Works up to 199.

=head1 SEE ALSO

Lingua::PT::Nums2Ords

=head1 AUTHOR

Jose Alves de Castro, E<lt>jac@localdomainE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Jose Alves de Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
