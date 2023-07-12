#!/bin/bash
set -ex

echo "Test pgcrypto"
psql -c "CREATE EXTENSION pgcrypto;"
psql -c "CREATE TABLE user_passwords (username varchar(100) PRIMARY KEY, crypttext text);"
psql -c "INSERT INTO user_passwords (username, crypttext)
VALUES ('user1', pgp_sym_encrypt('user1_password','<Password_Key>')),
    ('user2', pgp_sym_encrypt('user2_password','<Password_Key>'));"
psql -c "SELECT * FROM user_passwords;"
