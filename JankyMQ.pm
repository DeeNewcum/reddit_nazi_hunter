#
#                 _             _          __  __  ____
#                | |           | |        |  \/  |/ __ \
#                | | __ _ _ __ | | ___   _| \  / | |  | |
#            _   | |/ _` | '_ \| |/ / | | | |\/| | |  | |
#           | |__| | (_| | | | |   <| |_| | |  | | |__| |
#            \____/ \__,_|_| |_|_|\_\\__, |_|  |_|\___\_\
#                                     __/ |
#                                    |___/
#
#
# A MySQL-based homegrown message queue.
#
# Yeah, this is a bad idea.
#           https://softwareengineering.stackexchange.com/a/231415
#           https://stackoverflow.com/questions/13005410/why-do-we-need-message-brokers-like-rabbitmq-over-a-database-like-postgresql
#           https://www.eschrade.com/page/why-mysql-is-not-a-queue/
#           https://www.cloudamqp.com/blog/2015-11-23-why-is-a-database-not-the-right-tool-for-a-queue-based-system.html
# but I need a relatively low-throughput MQ, so it's ok.

package JankyMQ;


# $mysql_connection should be an already-connected MySQL connection
sub new {
    my ($class, $mysql_connection, $mq_table) = @_;
    (ref($mysql_connection) =~ /^DBI::/) or die;
    return bless {
            connection => $mysql_connection,
            table      => $mq_table,
        }, $class;
}


sub enqueue {
    my ($self, $command, $args) = @_;
    my $table = $self->{table};
    $self->{connection}->do("INSERT INTO $table (command, args) VALUES (?, ?)",
            undef, $command, $args);
}


sub dequeue {
    my ($self) = @_;

    $self->{connection}->do("START TRANSACTION;");

    my $sth = $self->{connection}->prepare(
            "SELECT id, command, args FROM $self->{table} WHERE process_id IS NULL
             ORDER BY id ASC LIMIT 1 FOR UPDATE SKIP LOCKED;");
    $sth->execute();
    my $row = $sth->fetchrow_hashref();
    $sth->finish();

    $self->{connection}->do("
            UPDATE $self->{table}
            SET process_id = CONNECTION_ID()
            WHERE id = ?
    ", undef, $row->{id});

    $self->{connection}->commit();

    $self->{last_dequeued} = $row->{id};

    return ($row->{command}, $row->{args});
}


# After dequeue(), after finishing the work for that item, call dequeue_finish()
# to finally remove the data from the queue.
sub dequeue_finish {
    my ($self) = @_;

    $self->{connection}->do("DELETE FROM $self->{table} WHERE ID=?",
                    undef, $self->{last_dequeued});

    $self->{last_dequeued} = undef;
}


# DANGER!  Deletes data!  You probably want to use this ONLY IN TESTING.
sub clear {
    my ($self) = @_;
    $self->{connection}->do("TRUNCATE TABLE $self->{table};");
}

1;
