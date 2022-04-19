# timescaledb-postgis

PostgreSQL with TimescaleDB extension along with the PostGIS extension.

This Docker image is derived from the official PostgreSQL image and includes Debian Linux as its operating system.

Provide an alternative to https://hub.docker.com/r/timescale/timescaledb-postgis and add multi architecture support.

Multi arch (linux/amd64,linux/arm64) postgres-timescaledb-postgis. There are no deb available for other architecture.

The latest release based on PostgreSQL 14.

From postgres:latest (Debian) with
+ timescaledb
+ timescaledb-toolkit (not multi-arch)
+ postgis
+ plpython3

PostgreSQL: https://hub.docker.com/_/postgres

Timescaledb: https://packagecloud.io/timescale/timescaledb

Postgis: https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt
