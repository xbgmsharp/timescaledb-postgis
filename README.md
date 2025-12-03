
[![Build Docker Image](https://github.com/xbgmsharp/timescaledb-postgis/actions/workflows/docker-image.yml/badge.svg)](https://github.com/xbgmsharp/timescaledb-postgis/actions/workflows/docker-image.yml)
[![Test Docker Image](https://github.com/xbgmsharp/timescaledb-postgis/actions/workflows/docker-test.yml/badge.svg)](https://github.com/xbgmsharp/timescaledb-postgis/actions/workflows/docker-test.yml)

# timescaledb-postgis

PostgreSQL bundle with additional extensions. https://hub.docker.com/r/xbgmsharp/timescaledb-postgis

This Docker image is derived from the official PostgreSQL image and includes Debian Linux as its operating system.

Provide an alternative to the deprecated image, https://hub.docker.com/r/timescale/timescaledb-postgis and add multi architecture support.

Packages are install using deb files provided by the respective components maintainers.

Multi arch (linux/amd64,linux/arm64) postgres-timescaledb-postgis.

The latest release based on the latest PostgreSQL, tag: `postgres:18-trixie`.

The image is updated weekly to keep up to date the system and the components.

From postgres:latest (Debian) with
+ timescaledb
+ timescaledb-toolkit
+ postgis
+ plpython3
+ pg_cron
+ pgvector
+ MobilityDB

PostgreSQL: https://hub.docker.com/_/postgres

Timescaledb: https://packagecloud.io/timescale/timescaledb

Postgis: https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt

pg_cron: https://github.com/citusdata/pg_cron

pgvector: https://github.com/pgvector/pgvector

MobilityDB: https://github.com/MobilityDB/MobilityDB
