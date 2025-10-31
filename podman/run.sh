podman pull --platform linux/arm64 cgr.dev/chainguard/valkey
podman pull --platform linux/arm64 cgr.dev/chainguard/node

podman pull --platform linux/arm64 cgr.dev/chainguard/mariadb

podman run --tz=local --name mariadb -d -p 3306:3306 -v /Users/ales/podman-volumes/mariadb:/var/lib/mysql -e MARIADB_ROOT_PASSWORD=mysecretpassword -e MARIADB_USER=ales -e MARIADB_PASSWORD=ales123 -e MARIADB_DATABASE=eexpose5 mariadb

podman run --tz=local --name valkey   -d -p 6379:6379 -v /Users/ales/podman-volumes/valkey:/data -e VALKEY_EXTRA_FLAGS="--appendonly yes" valkey
podman run --tz=local --name eexpose5 -d -p 3000:3000 -v /Users/ales/code/eexpose5/build:/app node index.js



# mysql
# podman pull --platform linux/arm64 bitnami/mysql
# podman run --name mysql  -d -p 3306:3306 -v /Users/ales/podman-volumes/mysql:/bitnami/mysql/data -e MYSQL_ROOT_PASSWORD=mysecretpassword -e MYSQL_USER=ales -e MYSQL_PASSWORD=ales123 mysql

# postgres
# podman pull --platform linux/arm64 cgr.dev/chainguard/postgres
# podman run --name postgres -d -p 5432:5432 -v /Users/ales/podman-volumes/postgres:/var/lib/postgresql/data -e POSTGRES_PASSWORD=mysecretpassword cgr.dev/chainguard/postgres:latest
