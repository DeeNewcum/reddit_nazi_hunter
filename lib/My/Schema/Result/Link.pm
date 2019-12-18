use utf8;
package My::Schema::Result::Link;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Link

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

=head1 TABLE: C<links>

=cut

__PACKAGE__->table("links");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 url

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 selftext

  data_type: 'tinyblob'
  is_nullable: 1

=head2 account

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 45

=head2 subreddit

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 45

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "url",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "selftext",
  { data_type => "tinyblob", is_nullable => 1 },
  "account",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 45 },
  "subreddit",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 45 },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 account

Type: belongs_to

Related object: L<My::Schema::Result::Account>

=cut

__PACKAGE__->belongs_to(
  "account",
  "My::Schema::Result::Account",
  { accountname => "account" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 subreddit

Type: belongs_to

Related object: L<My::Schema::Result::Subreddit>

=cut

__PACKAGE__->belongs_to(
  "subreddit",
  "My::Schema::Result::Subreddit",
  { id => "subreddit" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-17 20:50:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OF4+BA+5okzE6iRUJ/kWXg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
