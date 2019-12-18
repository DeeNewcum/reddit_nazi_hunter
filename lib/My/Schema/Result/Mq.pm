use utf8;
package My::Schema::Result::Mq;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

My::Schema::Result::Mq

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

=head1 TABLE: C<mq>

=cut

__PACKAGE__->table("mq");

=head1 ACCESSORS

=head2 order

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 command

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 args

  data_type: 'tinyblob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "order",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "command",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "args",
  { data_type => "tinyblob", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</order>

=back

=cut

__PACKAGE__->set_primary_key("order");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-17 20:50:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:R+6Lk9BFPo0YbAHUFcBUfQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
