package Dist::Zilla::PluginBundle::GitFlow;
BEGIN {
  $Dist::Zilla::PluginBundle::GitFlow::VERSION = '0.006';
}
# ABSTRACT: all git-flow plugins in one go

use Moose;
use Class::MOP;

with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
    my ($self) = @_;

    $self->add_plugins(
        qw(
            GitFlow::NextVersion
            GitFlow::NextRelease
            Git::Check
        ),
        [
            'Git::Commit' => {
                'commit_msg' => 'Bump up to v%v',
            },
        ],
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;


=pod

=encoding utf-8

=head1 NAME

Dist::Zilla::PluginBundle::GitFlow - all git-flow plugins in one go

=head1 VERSION

version 0.006

=head1 SYNOPSIS

In your F<dist.ini>:

    [@GitFlow]

=head1 DESCRIPTION

This is a plugin bundle to load git-flow and git plugins.
It is equivalent to:

    [GitFlow::NextVersion]
    [GitFlow::NextRelease]
    [Git::Check]
    [Git::Commit]
    commit_msg = Bump up to v%v ; default

It uses L<Dist::Zilla::Plugin::GitFlow::NextRelease>
and L<Dist::Zilla::Plugin::GitFlow::NexvVersion>
rather than L<Dist::Zilla::Plugin::NextRelease>
and L<Dist::Zilla::Plugin::NextVersion>.

It includes the following plugins with their default configuration
except L<Git::Commit>:

=over 4

=item *

L<Dist::Zilla::Plugin::GitFlow::NextVersion>

=item *

L<Dist::Zilla::Plugin::GitFlow::NextRelease>

=item *

L<Dist::Zilla::Plugin::Git::Check>

=item *

L<Dist::Zilla::Plugin::Git::Commit>

=back

=for Pod::Coverage configure

=head1 AUTHOR

Keedi Kim - 김도형 <keedi@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Keedi Kim.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

