#!/bin/bash
set -ex

echo "Test pgvector Extension"
psql -c "CREATE EXTENSION vector;"
psql -c "SELECT extversion FROM pg_extension where extname = 'vector';"

echo "Test pgvector Function"
psql -c "CREATE TABLE items (id bigserial PRIMARY KEY, embedding vector(3));";
psql -c "INSERT INTO items (embedding) VALUES ('[1,2,3]'), ('[4,5,6]');"
psql -c "SELECT * FROM items ORDER BY embedding <-> '[3,1,2]' LIMIT 5;"
psql -c "SELECT * FROM items WHERE embedding <-> '[3,1,2]' < 5;"
