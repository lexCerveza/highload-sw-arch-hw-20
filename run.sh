#!/bin/bash

docker-compose up -d

sleep 5

docker exec postgres-b1 psql -U postgres -f "/tmp/pg_b1.sql"
docker exec postgres-b2 psql -U postgres -f "/tmp/pg_b2.sql"
docker exec postgres-b psql -U postgres -f "/tmp/pg_b.sql"

docker exec postgres-sa psql -U postgres -f "/tmp/pg_stand_alone.sql"

docker exec postgres-b psql -U postgres -d task -c "insert into books values (1, 1, 'test', 'test', 1990);"
docker exec postgres-b psql -U postgres -d task -c "insert into books values (1, 2, 'test', 'test', 1990);"

docker exec postgres-b psql -U postgres -d task -c "delete from books_1;"
docker exec postgres-b psql -U postgres -d task -c "delete from books_2;"
docker exec postgres-sa psql -U postgres -d task -c "delete from books;"

echo "Sharded PostgreSQL stats"
time docker exec postgres-b psql -U postgres -d task -c "call populate(100000);"

echo "Stand-alone PostgreSQL stats"
time docker exec postgres-sa psql -U postgres -d task -c "call populate(100000);"