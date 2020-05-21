# How to use pgbouncer 

Use [pgbouncer](https://www.pgbouncer.org/) to rename database.

This project use [`pgbouncer/pgbouncer`](https://gitlab.com/aztek-io/oss/containers/pgbouncer-container/) Docker Image.

```
$ ./scripts/up.sh
```

```
$ pgcli "postgres://postgres:password@127.0.0.1:5532/foobar"
postgres> \dt
+----------+----------+--------+----------+
| Schema   | Name     | Type   | Owner    |
|----------+----------+--------+----------|
| public   | contacts | table  | postgres |
+----------+----------+--------+----------+
SELECT 1
Time: 0.032s
```

```
$ pgcli "postgres://user1:secret1@127.0.0.1:5532/foobar"
```

In another shell:

```
$ ./scripts/show-actives-connections.sh
usename  | application_name | client_addr | ssl
----------+------------------+-------------+-----
          |                  |             | f
 postgres |                  |             | f
 postgres | pgcli            | 172.24.0.3  | f
 postgres | pgcli            | 172.24.0.3  | f
 postgres | psql             |             | f
          |                  |             | f
          |                  |             | f
          |                  |             | f
(8 rows)
```



echo  -n "1234admin" | md5sum
echo  -n "passwordpostgres" | md5sum


https://www.postgresql.org/message-id/flat/82ippnky8l.fsf%40mid.bfk.de