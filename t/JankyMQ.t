    use strict;
    use warnings;

    use Test::More;
    use DBI;

    use lib 't', '.';
    use JankyMQ;

my $test_dsn      = 'dbi:mysql:database=excavator_test;host=localhost';
my $test_user     = 'excavator';
my $test_password = 'excavator';

my $dbh;
eval {$dbh= DBI->connect($test_dsn, $test_user, $test_password,
                      { RaiseError => 1, PrintError => 1, AutoCommit => 0 });};

my $mq = JankyMQ->new($dbh, "mq");

$mq->clear();

$mq->enqueue("test1", undef);
my ($cmd, $args) = $mq->dequeue();
is($cmd, "test1", "enqueue=>dequeue");


my ($count) = $dbh->selectrow_array("SELECT COUNT(*) FROM mq");
is($count, 1,        "count() == 1");

$mq->dequeue_finish();

($count) = $dbh->selectrow_array("SELECT COUNT(*) FROM mq");
is($count, 0,        "dequeue_finish()");


done_testing();

$dbh->disconnect();
