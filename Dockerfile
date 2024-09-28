FROM postgres:16-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install gnupg apt-transport-https lsb-release curl

## Timescaledb
# https://packagecloud.io/timescale/timescaledb
#
RUN curl -s https://packagecloud.io/install/repositories/timescale/timescaledb/script.deb.sh | bash

RUN apt-get -q update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install timescaledb-2-postgresql-16 timescaledb-tools
#        timescaledb-toolkit-postgresql-16
#RUN sed -r -i "s/[#]*\s*(shared_preload_libraries)\s*=\s*'(.*)'/\1 = 'timescaledb,\2'/;s/,'/'/" /usr/share/postgresql/postgresql.conf.sample

## Postgis
# https://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS24UbuntuPGSQL10Apt
#
RUN apt-get -q update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-16-postgis-3 \
        postgresql-16-postgis-3-scripts \
        postgresql-16-pgrouting \
        postgresql-16-pgrouting-scripts

## pg_cron
# https://github.com/citusdata/pg_cron
#
RUN apt-get -q update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-16-cron

## Extension plpython3
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python3 postgresql-plpython3-16 python3-requests

## Pgvector
# https://github.com/pgvector/pgvector
#
RUN apt-get -q update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-16-pgvector

## MobilityDB
# https://github.com/MobilityDB/MobilityDB
#
RUN apt-get -q update && \
        DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-16-mobilitydb

## pgbackrest
# https://pgbackrest.org/
#
#RUN apt-get -q update && \
#        DEBIAN_FRONTEND=noninteractive apt-get -y install pgbackrest

## Config
# extension timescaledb and others must be preloaded
RUN echo "shared_preload_libraries = 'timescaledb,pg_stat_statements,pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample
# timescaledb telemetry off
RUN echo "timescaledb.telemetry_level=off" >> /usr/share/postgresql/postgresql.conf.sample
# Fix: initdb: error: invalid locale settings; check LANG and LC_* environment variables
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get -y autoremove --purge && apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt
