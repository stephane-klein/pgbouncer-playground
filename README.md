# How to configure PostgreSQL database alias with PgBouncer

In this playground I use [pgbouncer](https://www.pgbouncer.org/) to create a PostgreSQL [database alias](https://www.postgresql.org/message-id/flat/82ippnky8l.fsf%40mid.bfk.de)

Use case:

- I want to rename the database name but I have several externat service to update, I would like to migrate theirs iteratively


This project use [`pgbouncer/pgbouncer`](https://gitlab.com/aztek-io/oss/containers/pgbouncer-container/) Docker Image.

## Getting started

```
$ ./scripts/generate-self-signed-certificate.sh
$ ./scripts/up.sh
```

Connect to `postgres` service with ssl:

```
$ pgcli "postgres://postgres:password@127.0.0.1:5432/postgres?sslmode=require"
```

Check SSL connection:

```
$ ./scripts/show-actives-connections.sh
 usename  | application_name | client_addr | ssl
----------+------------------+-------------+-----
...
 postgres | pgcli            | 172.24.0.1  | t
...
``

Connect to `pgbounnce` service with ssl on alias database named `foobar`:

```
$ pgcli "postgres://postgres:password@127.0.0.1:5532/foobar?sslmode=require"
postgres> \dt
+----------+----------+--------+----------+
| Schema   | Name     | Type   | Owner    |
|----------+----------+--------+----------|
| public   | contacts | table  | postgres |
+----------+----------+--------+----------+
SELECT 1
Time: 0.032s
```

Check SSL connection:

```
$ ./scripts/show-actives-connections.sh
 usename  | application_name | client_addr | ssl
----------+------------------+-------------+-----
 postgres | pgcli            | 172.24.0.3  | t
```

Connect to `pgbounnce` service with ssl on with `user1`:

```
$ pgcli "postgres://user1:secret1@127.0.0.1:5532/foobar?sslmode=require"
user1@127:foobar> select * from contacts;
permission denied for table contacts
```

Don't forget to add users in `config/userlist.txt` (see issue [#1](https://github.com/stephane-klein/pgbouncer-playground/issues/1)), with:

```
$ echo "\"user1\" \"md5$(echo  -n "secret1user1" | md5sum | sed 's/ .*$//')\"" >> config/userlist.txt
$ echo "\"postgres\" \"md5$(echo  -n "passwordpostgres" | md5sum | sed 's/ .*$//')\"" >> config/userlist.txt
```
