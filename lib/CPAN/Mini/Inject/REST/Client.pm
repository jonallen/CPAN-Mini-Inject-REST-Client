package CPAN::Mini::Inject::REST::Client;

use 5.010;
use strict;
use warnings;
use App::Cmd::Setup -app;
use Config::General qw/ParseConfig/;
use File::HomeDir;
use File::Spec::Functions qw/catfile/;

=head1 NAME

CPAN::Mini::Inject::REST::Client - Command-line client for CPAN::Mini::Inject::REST

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use CPAN::Mini::Inject::REST::Client;

    my $foo = CPAN::Mini::Inject::REST::Client->new();
    ...

=cut

sub config {
    state $config = {ParseConfig(config_file())};
    return $config;
}

sub config_file {
    my @files = (
        $ENV{MCPANI_CLIENT_CONFIG},
        catfile(File::HomeDir->my_home, '.mcpani-client'),
        '/usr/local/etc/mcpani-client',
        '/etc/mcpani-client',
    );
    
    foreach my $file (grep {defined $_} @files) {
        return $file if -r $file;
    }
}

=head1 AUTHOR

Jon Allen (JJ), C<< <jj at jonalen.info> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-cpan-mini-inject-rest-client at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=CPAN-Mini-Inject-REST-Client>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc CPAN::Mini::Inject::REST::Client


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=CPAN-Mini-Inject-REST-Client>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/CPAN-Mini-Inject-REST-Client>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/CPAN-Mini-Inject-REST-Client>

=item * Search CPAN

L<http://search.cpan.org/dist/CPAN-Mini-Inject-REST-Client/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Jon Allen (JJ).

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of CPAN::Mini::Inject::REST::Client
