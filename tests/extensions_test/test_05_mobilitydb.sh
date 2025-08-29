#!/bin/bash
set -ex

echo "Test MobilityDB Extension"
psql -c "CREATE EXTENSION mobilitydb;"
psql -c "SELECT extversion FROM pg_extension where extname = 'mobilitydb';"
psql -c "SELECT mobilitydb_full_version();"

echo "Test MobilityDB Function"
psql -c "SELECT tfloat '[1.5@2001-01-01 08:00:00]';";
psql -c "SELECT ttext '[BBB@2001-01-01 08:00:00, BBB@2001-01-03 08:00:00]';"
psql -c "SELECT tgeompoint '[SRID=5435;Point(0 0)@2001-01-01,SRID=4326;Point(0 1)@2001-01-02]';"
psql -c "SELECT valueAtTimestamp(tfloat '[1@2001-01-01, 4@2001-01-04)', '2001-01-02');"
psql -c "SELECT update(tint '{1@2001-01-01, 3@2001-01-03, 5@2001-01-05}', tint '{5@2001-01-03, 7@2001-01-07}');"
psql -c "SELECT deleteTime(tfloat '[1@2001-01-01, 4@2001-01-02, 2@2001-01-04, 5@2001-01-05]', tstzspan '[2001-01-02, 2001-01-04]');"

psql <<EOF
\set ON_ERROR_STOP on
CREATE TABLE mobility (
  trip public.tgeogpoint NULL,
  trip_float public.tfloat NULL,
  trip_text public.ttext NULL
);

INSERT INTO mobility (trip, trip_float, trip_text) VALUES
  ('[SRID=4326;Point(0 0)@2001-01-01,SRID=4326;Point(0 1)@2001-01-02]', '[1.5@2001-01-01 08:00:00]', '["First Point"@2001-01-02 14:54:58.874+00]'),
  ('[SRID=4326;Point(0 0)@2001-01-01,SRID=4326;Point(0 2)@2001-01-02]', '[2.5@2001-01-01 08:00:00]', '["Second Point"@2001-01-02 14:54:58.874+00]'),
  ('[SRID=4326;Point(0 0)@2001-01-01,SRID=4326;Point(0 3)@2001-01-02]', '[3.5@2001-01-01 08:00:00]', '["Third Point"@2001-01-02 14:54:58.874+00]');

SELECT trajectory(m.trip) from mobility m;
EOF