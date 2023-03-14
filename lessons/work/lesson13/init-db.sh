#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
	CREATE DATABASE mydb;
	CREATE TABLE mydb.mytbl (id Int64, str_1024 Text) ENGINE = Log;
	INSERT INTO mydb.mytbl SELECT * FROM generateRandom('id Int64, str_1024 Text', 1, 1024) LIMIT 100;

EOSQL
