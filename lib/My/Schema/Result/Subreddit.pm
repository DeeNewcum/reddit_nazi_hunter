use utf8;
package My::Schema::Result::Subreddit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Subreddit

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

=head1 TABLE: C<subreddits>

=cut

__PACKAGE__->table("subreddits");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 subredditname

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 weight

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 remark

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=head2 banned

  data_type: 'integer'
  default_value: 0
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "subredditname",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "weight",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "remark",
  { data_type => "varchar", is_nullable => 1, size => 256 },
  "banned",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<srname_UNIQUE>

=over 4

=item * L</subredditname>

=back

=cut

__PACKAGE__->add_unique_constraint("srname_UNIQUE", ["subredditname"]);

=head1 RELATIONS

=head2 comments

Type: has_many

Related object: L<My::Schema::Result::Comment>

=cut

__PACKAGE__->has_many(
  "comments",
  "My::Schema::Result::Comment",
  { "foreign.subreddit" => "self.subredditname" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 links

Type: has_many

Related object: L<My::Schema::Result::Link>

=cut

__PACKAGE__->has_many(
  "links",
  "My::Schema::Result::Link",
  { "foreign.subreddit" => "self.subredditname" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 11:26:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AQTeoQVwmCZtCTQ55S3EYA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
