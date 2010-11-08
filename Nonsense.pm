package Module;
use strict;
use warnings;
use Carp 'croak';

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(toilet );

sub toilet {
    my %argv = @_;
    my $cmd  = 'toilet';
    if ( defined( $argv{'FONT'} ) )    { $cmd .= " -f $argv{'FONT'}"; }
    if ( defined( $argv{'FONTDIR'} ) ) { $cmd .= " -d $argv{'FONTDIR'}"; }
    if ( defined( $argv{'FILTERS'} ) ) {
        my @filters = split( ' ', $argv{'FILTERS'} );
        foreach my $filter (@filters) {
            $cmd .= " -F $filter";
        }
    }
    if ( defined( $argv{'GAY'} ) )    { $cmd .= ' -F gay'; }
    if ( defined( $argv{'METAL'} ) )  { $cmd .= ' -F metal'; }
    if ( defined( $argv{'FORMAT'} ) ) { $cmd .= " -E $argv{'FORMAT'}"; }
    if ( defined( $argv{'IRC'} ) )    { $cmd .= ' -E irc'; }
    if ( defined( $argv{'HTML'} ) )   { $cmd .= ' -E html'; }
    if ( defined( $argv{'TEXT'} ) )   { $cmd .= " $argv{'TEXT'}"; }
    else { croak('toilet: missing required field TEXT'); }

    my $results = system($cmd);
    return $results;
}

sub fortune {
    my %argv = @_;
    
}

1;
