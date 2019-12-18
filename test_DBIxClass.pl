#!/usr/bin/perl

    use strict;
    use warnings;

    use DBIx::Class;

    use Data::Dumper;
    #use Devel::Comments;           # uncomment this during development to enable the ### debugging statements


my $user     = 'excavator';
my $password = 'excavator';
my $schema = My::Schema->connect('dbi:mysql:database=excavator;host=localhost', $user, $password, '' );

print Dumper $schema->resultset('User')->find(14);



package My::Schema;
use base qw/DBIx::Class::Schema/;
# load My::Schema::Result::* and their resultset classes
__PACKAGE__->load_namespaces();

package My::Schema::Result::User;
use base qw/DBIx::Class::Core/;
__PACKAGE__->table('user');
__PACKAGE__->add_columns(qw/ username /);
