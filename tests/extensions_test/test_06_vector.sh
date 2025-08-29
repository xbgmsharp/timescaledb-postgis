#!/bin/bash
set -ex

echo "Test pgvector Extension"
psql -c "CREATE EXTENSION vector;"
psql -c "SELECT extversion FROM pg_extension where extname = 'vector';"

echo "Test pgvector Function"
psql <<EOF
\set ON_ERROR_STOP on

CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));
INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');
SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;
SELECT * FROM items WHERE embedding <-> '[3,1,2]' < 5;
EOF
