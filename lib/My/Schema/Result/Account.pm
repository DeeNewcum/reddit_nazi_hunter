use utf8;
package My::Schema::Result::Account;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Account

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

=head1 TABLE: C<accounts>

=cut

__PACKAGE__->table("accounts");

=head1 ACCESSORS

=head2 accountname

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 weight

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 remark

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=cut

__PACKAGE__->add_columns(
  "accountname",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "weight",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "remark",
  { data_type => "varchar", is_nullable => 1, size => 256 },
);

=head1 PRIMARY KEY

=over 4

=item * L</accountname>

=back

=cut

__PACKAGE__->set_primary_key("accountname");

=head1 RELATIONS

=head2 comments

Type: has_many

Related object: L<My::Schema::Result::Comment>

=cut

__PACKAGE__->has_many(
  "comments",
  "My::Schema::Result::Comment",
  { "foreign.author" => "self.accountname" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 09:37:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IYpKuNlmsyZqxE0XS1Nxpg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
