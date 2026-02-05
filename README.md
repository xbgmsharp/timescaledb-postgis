
[![Build Docker Image](https://github.com/xbgmsharp/postgsail-db/actions/workflows/docker-image.yml/badge.svg)](https://github.com/xbgmsharp/postgsail-db/actions/workflows/docker-image.yml)
[![Test Docker Image](https://github.com/xbgmsharp/postgsail-db/actions/workflows/docker-test.yml/badge.svg)](https://github.com/xbgmsharp/postgsail-db/actions/workflows/docker-test.yml)

# postgsail-db

PostgreSQL bundle with additional extensions. https://hub.docker.com/r/xbgmsharp/postgsail-db

This Docker image is derived from the official PostgreSQL image and includes Debian Linux as its operating system.

Packages are install using deb files provided by the respective components maintainers.

Multi arch (linux/amd64,linux/arm64) postgres-postgsail-db.

The latest release based on the latest PostgreSQL, tag: `postgres:18-trixie`.

The image is updated weekly to keep up to date the system and the components.

From postgres:latest (Debian) with
+ timescaledb
+ timescaledb-toolkit
+ postgis
+ plpython3
+ pg_cron
+ MobilityDB

PostgreSQL: https://hub.docker.com/_/postgres

Timescaledb: https://packagecloud.io/timescale/timescaledb

Postgis: https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt

pg_cron: https://github.com/citusdata/pg_cron

MobilityDB: https://github.com/MobilityDB/MobilityDB
