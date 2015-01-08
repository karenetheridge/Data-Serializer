package Data::Serializer::JSON::MaybeXS;
BEGIN { @Data::Serializer::JSON::MaybeXS::ISA = qw(Data::Serializer) }

use warnings;
use strict;
use JSON::MaybeXS qw(encode_json decode_json);
use vars qw($VERSION @ISA);

$VERSION = '0.04';

sub serialize {
	return encode_json($_[1]);
}

sub deserialize {
	#return JSON->VERSION < 2 ? JSON->new->jsonToObj($_[1]) : JSON->new->decode($_[1]);
	$_[1] and return decode_json($_[1]);
}

1;
__END__



=head1 NAME

Data::Serializer::JSON::MaybeXS - Creates bridge between Data::Serializer and JSON::MaybeXS

=head1 SYNOPSIS

  use Data::Serializer::JSON;

=head1 DESCRIPTION

Module is used internally to Data::Serializer

=over 4
       
=item B<serialize> - Wrapper to normalize serializer method name

=item B<deserialize> - Wrapper to normalize deserializer method name


=back

=head1 AUTHOR

Naoya Ito <naoya@bloghackers.net>

Patch to JSON 2 by Makamaka <makamaka@donzoko.net>

Patch to JSON::MaybeXS by Karen Etheridge <ether@cpan.org>

=head1 COPYRIGHT

  This program is free software; you can redistribute it
  and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO

perl(1), Data::Serializer(3), JSON::MaybeXS(3).

=cut

