use utf8;
package My::Schema::Result::Domain;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Domain

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

=head1 TABLE: C<domains>

=cut

__PACKAGE__->table("domains");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 weight

  data_type: 'integer'
  is_nullable: 1

=head2 remark

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "weight",
  { data_type => "integer", is_nullable => 1 },
  "remark",
  { data_type => "varchar", is_nullable => 1, size => 256 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<domain_UNIQUE>

=over 4

=item * L</domain>

=back

=cut

__PACKAGE__->add_unique_constraint("domain_UNIQUE", ["domain"]);

=head1 RELATIONS

=head2 links

Type: has_many

Related object: L<My::Schema::Result::Link>

=cut

__PACKAGE__->has_many(
  "links",
  "My::Schema::Result::Link",
  { "foreign.domain" => "self.domain" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 11:26:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fIS8WfH3uaQUT4V6nUkyQw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
