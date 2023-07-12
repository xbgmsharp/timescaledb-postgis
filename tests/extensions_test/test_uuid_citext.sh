#!/bin/bash
set -ex 

psql <<EOF
CREATE EXTENSION "uuid-ossp";
CREATE EXTENSION "citext";

CREATE TABLE users (
    userid  UUID NOT NULL UNIQUE DEFAULT uuid_generate_v4(),
    nick    CITEXT,
    pref    JSONB);

INSERT INTO users (nick, pref) VALUES ( 'larry',  '{"a": {"b":"foo"}}' );
INSERT INTO users (nick, pref) VALUES ( 'TOM',  '{"x": {"y":"foo"}}' );

SELECT * FROM users WHERE nick = 'Larry';
SELECT * FROM users WHERE nick = 'tom';
EOF