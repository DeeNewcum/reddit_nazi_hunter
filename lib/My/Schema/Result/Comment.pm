use utf8;
package My::Schema::Result::Comment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Comment

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<comments>

=cut

__PACKAGE__->table("comments");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 author

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 subredditid

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 body

  data_type: 'mediumblob'
  is_nullable: 0

=head2 score

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "author",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "subredditid",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "body",
  { data_type => "mediumblob", is_nullable => 0 },
  "score",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-17 20:50:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fmef67CSmueNGbxKxPgqbA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
