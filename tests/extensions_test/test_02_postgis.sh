#!/bin/bash
set -ex

echo "Test PostGIS Extension"
psql -c "CREATE EXTENSION postgis;"
psql -c "SELECT extversion FROM pg_extension where extname = 'postgis';"
psql -c "SELECT PostGIS_Version();"

echo "Test PostGIS Geometry Function"
psql <<EOF
\set ON_ERROR_STOP on

CREATE TABLE test_geometry_table (id serial primary key, geom geometry(Point, 4326));
INSERT INTO test_geometry_table (geom) VALUES (ST_GeomFromText('POINT(0 0)', 4326));
SELECT * FROM test_geometry_table;
EOF
