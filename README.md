# highload-sw-arch-hw-20

# Prerequisites
* docker
* linux + bash

# 1. Run Postgres servers (stand-alone, 2 shards + master server) + run test
```
./run.sh
```

# 2. Observe results in console

```
Sharded PostgreSQL stats

CALL

real    0m40.849s
user    0m0.039s
sys     0m0.013s

Stand-alone PostgreSQL stats
CALL

real    0m1.160s
user    0m0.035s
sys     0m0.017s
```

# 3. Clean up

```
./cleanup.sh
```