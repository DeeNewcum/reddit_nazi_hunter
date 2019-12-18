#!/usr/bin/perl

    use strict;
    use warnings;

    use DBIx::Class;

    use lib './lib';
    use My::Schema;

    use Data::Dumper;
    #use Devel::Comments;           # uncomment this during development to enable the ### debugging statements


my $user     = 'excavator';
my $password = 'excavator';
my $schema = My::Schema->connect('dbi:mysql:database=excavator;host=localhost', $user, $password, '' );

print Dumper { $schema->resultset('Subreddit')->find('t5_3568k')->get_columns() };


