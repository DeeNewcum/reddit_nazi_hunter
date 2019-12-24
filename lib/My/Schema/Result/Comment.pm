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
  is_foreign_key: 1
  is_nullable: 0
  size: 20

=head2 subreddit

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 20

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
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 20 },
  "subreddit",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 20 },
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

=head1 RELATIONS

=head2 author

Type: belongs_to

Related object: L<My::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
  "author",
  "My::Schema::Result::Account",
  { accountname => "author" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 subreddit

Type: belongs_to

Related object: L<My::Schema::Result::Subreddit>

=cut

__PACKAGE__->belongs_to(
  "subreddit",
  "My::Schema::Result::Subreddit",
  { subredditname => "subreddit" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 11:26:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iMHYe1C7DHdxN6VJ0A45fA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
