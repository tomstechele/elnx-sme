# De actualiteit opdracht

## Intro

Doordat Fail2ban echt niet vooruit ging ben ik over geschakelend naar een andere opdracht. Namelijk: Verbeter de performantie van MariaDb zoals geïnstalleerd via de rol bertvv.maraidb aan de hand van de richtlijnen van Aun. Ik hoop dat deze opdracht wel lukt.



# Intro

Op de site [linuxpitstop](http://linuxpitstop.com/tips-to-improve-mariadb-performance/) krijg je verschillende tips om de MariaDb performance te verbeteren. Nu de opdracht is om deze performance verbeteringen toe te passen op de role van [bertvv](https://github.com/bertvv/ansible-role-mariadb).

# De verschillende mogelijke verbeteringen
- Types of database engines
- Parameters for improvement of performance
- InnoDb file-per-table
- InnoDB buffer pool size
- Disable swap in mysql
- Max connections
- Thread cache size
- Disable Mysql dns lookups
- Query cache size
- Tmp table size & max heap table size
- Slow query logs
- Idle connections

## Types of database engines

Two Types:
  - MyISAM
  - InnoDB

  The main and important difference beteen them is that MyISAM supports table level locking while InnoDB supports row level locking but with this benefit of InnoDB there is a drawback that it’s slower than MyISAM; like renaming InnoDB table will take much more time as compared to MyISAM table.


- Alle performance zijn al toegevoegd of al verbetert. Ikzelf heb er ook nog gevonden.

# Improvements Security

## max_connect_error

Description: Limit to the number of successive failed connects from a host before the host is blocked from making further connections. The count for a host is reset to zero if they successfully connect. To unblock, flush the host cache with a FLUSH HOSTS statement or mysqladmin flush-hosts.

By default, mysqld blocks a host after 100 connection errors. You can adjust the value by setting max_connect_errors at server startup:


```
max_connect_errors = {number}
```

#### /templates/etc_my.cnf.d_server.cnf

```
max_connect_errors            = {{ mariadb_max_connect_errors }}
```

#### /defaults/mains.yml

```
mariadb_max_connect_errors            = 10
```

## sysdate_is_now

Description: Non-default option to alias SYSDATE() to NOW() to make it safe for replication. Since 5.0, SYSDATE() has returned a 'dynamic' value different for different invocations, even within the same statement.


```
sysdate_is_now = {1 or 0}
```

#### /templates/etc_my.cnf.d_server.cnf

```
sysdate_is_now           = {{ mariadb_sysdate_is_now }}
```

#### /defaults/mains.yml

```
mariadb_sysdate_is_now           = 1
```

# Improvements Binary logging


## Log_bin

Description: The binary log contains a record of all changes to the databases, both data and structure, as well as how long each statement took to execute. It consists of a set of binary log files and an index.

```
log_bin = {path}
```

#### /templates/etc_my.cnf.d_server.cnf

```
log_bin          = {{ mariadb_log_bin }}
```

#### /defaults/mains.yml

```
log_bin          = /var/lib/mysql/data/mysql-bin
```

## Expire_logs_days

Description: Number of days after which the binary log can be automatically removed. By default 0, or no automatic removal. When using replication, should always be set higher than the maximum lag by any slave. Removals take place when the server starts up, when the binary log is flushed, when the next binary log is created after the previous one reaches the maximum size, or when running PURGE BINARY LOGS.

```
expire_logs_days = {number}
```

#### /templates/etc_my.cnf.d_server.cnf

```
expire_logs_days         = {{ mariadb_expire_logs_days }}
```

#### /defaults/mains.yml

```
expire_logs_days          = 10
```


## Sync_binlog

Description: MariaDB will synchronize its binary log file to disk after this many events. The default is 0, in which case the operating system handles flushing the file to disk. 1 is the safest, but slowest, choice, since the file is flushed after each write. If autocommit is enabled, there is one write per statement, otherwise there's one write per transaction. If the disk has cache backed by battery, synchronization will be fast and a more conservative number can be chosen.

```
sync_binlog = {0 or 1}
```

#### /templates/etc_my.cnf.d_server.cnf

```
sync_binlog         = {{ mariadb_sync_binlog }}
```

#### /defaults/mains.yml

```
sync_binlog :    1      
```

# Improvements Caches and limits

Description: If set to 0, the query cache is disabled (although a buffer of query_cache_size bytes is still allocated). If set to 1 all SELECT queries will be cached unless SQL_NO_CACHE is specified. If set to 2 (or DEMAND), only queries with the SQL CACHE clause will be cached. Note that if the server is started with the query cache disabled, it cannot be enabled at runtime. Starting from MariaDB 10.1.7, query_cache_type is automatically set to ON if the server is started with the query_cache_size set to a non-zero (and non-default) value.


```
query_cache_type = {ON or OFF}or {O or 1}
```

#### /templates/etc_my.cnf.d_server.cnf

```
query_cache_type        = {{ mariadb_query_cache_type }}
```

#### /defaults/mains.yml

```
query_cache_type        = 0
```

## Thread_cache_size

Description: Number of threads server caches for re-use. If this limit hasn't been reached, when a client disconnects, its threads are put into the cache, and re-used where possible. These are freed after 5 minutes of idle time. Normally this setting has little effect, as the other aspects of the thread implementation are more important, but increasing it can help servers with high volumes of connections per second so that most can use a cached, rather than a new, thread. The cache miss rate can be calculated as the server status variables threads_created/connections. If the thread pool is active, thread_cache_size is ignored. From MariaDB 10.2.0, the default is automatically set to the smaller of either 256, or the max_connections size.


```
thread_cache_size = {numeric}
```

#### /templates/etc_my.cnf.d_server.cnf

```
thread_cache_size        = {{ mariadb_query_thread_cache_size }}
```

#### /defaults/mains.yml

```
thread_cache_size        = 50
```


## Open_files_limit

Description: The number of file descriptors available to mysqld. Increase if you are getting the Too many open files error. If set to 0, then mysqld will reserve max_connections*5 or max_connections + table_open_cache*2 (whichever is larger) number of files. Note that MariaDB cannot set this to exceed the hard limit imposed by the operating system, and you may need to change this. For example, by adding the following lines to /etc/security/limits.conf


```
open_files_limit = {0 to 4294967295 }
```

#### /templates/etc_my.cnf.d_server.cnf

```
open_files_limit       = {{ mariadb_query_open_files_limit }}
```

#### /defaults/mains.yml

```
open_files_limit        = 65353
```


# InnoDB ( improve innoDb performance)

## Inno_flush_method

Description:  XtraDB/InnoDB flushing method. Windows always uses async_unbuffered and this variable then has no effect. On Unix, by default fsync() is used to flush data and logs. Adjusting this variable can give performance improvements.

- `O_DSYNC - O_DSYNC` is used to open and flush logs, and fsync() to flush the data files.
- `O_DIRECT - O_DIRECT` or directio(), is used to open data files, and fsync() to flush data and logs.
fdatasync - an old default value that follows the default behavior of using fsync(), but replaced with the unset default to avoid confusion between fdatasync() and fsync().
- `O_DIRECT_NO_FSYNC` - introduced in MariaDB 10.0. Uses O_DIRECT during flushing I/O, but skips fsync() afterwards. Not suitable for XFS filesystems.
- `ALL_O_DIRECT` - introduced in MariaDB 5.5 / Percona 5.5, and available with XtraDB only. Uses O_DIRECT for opening both data and logs and fsync() to flush data but not logs. Use with large InnoDB files only, otherwise may cause a performance degradation. Set innodb_log_block_size to 4096 on ext4 filesystems. This is the default log block size on ext4 and will avoid unaligned AIO/DIO warnings.


```
innodb_flush_method = O_DSYNC / O_DIRECT / O_DIRECT_NO_FSYNC / ALL_O_DIRECT
```

#### /templates/etc_my.cnf.d_server.cnf

```
innodb_flush_method            = {{ mariadb_innodb_flush_method }}
```

#### /defaults/mains.yml

```
innodb_flush_method            = O_DIRECT
```



## Innodb_log_files_in_group

Description: Number of physical files in the InnoDB redo log.

```
Innodb_log_files_in_group = {1 to 100}
```

#### /templates/etc_my.cnf.d_server.cnf

```
innodb_log_files_in_group            = {{ mariadb_innodb_log_files_in_group }}
```

#### /defaults/mains.yml

```
innodb_log_files_in_group            = 2
```

## innodb_buffer_pool_load_at_startup

Description: Specifies whether the buffer pool is automatically warmed up when the server starts by loading the pages held earlier. The related innodb_buffer_pool_dump_at_shutdown specifies whether pages are saved at shutdown.

```
innodb_buffer_pool_at_startup = {ON / OFF}
```

#### /templates/etc_my.cnf.d_server.cnf

```
innodb_buffer_pool_load_at_startup            = {{ mariadb_innodb_buffer_pool_load_at_startup }}
```

#### /defaults/mains.yml

```
innodb_buffer_pool_load_at_startup           = ON
```






## Resources

- http://linuxpitstop.com/tips-to-improve-mariadb-performance/
- https://mariadb.com/kb/en/library/xtradbinnodb-server-system-variables/#innodb_flush_method
- https://www.percona.com/blog/2014/05/23/improve-innodb-performance-write-bound-loads/
- https://www.tecmint.com/mysql-mariadb-performance-tuning-and-optimization/
- https://mariadb.com/kb/en/library/configuring-mariadb-for-optimal-performance/
- https://mariadb.com/kb/en/library/optimization-and-tuning/
- https://www.saotn.org/mysql-innodb-performance-improvement/
- http://mysqlblog.fivefarmers.com/2013/08/08/understanding-max_connect_errors/
- https://dev.mysql.com/doc/refman/5.5/en/blocked-host.html
