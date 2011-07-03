#!/bin/bash 

if [ $# != 2 ] 
then 
	echo "usage: <seed-db-dump> <backup-repo-name>" 
	exit 1
fi 

if ! [ -d logs ] 
then 
	mkdir logs
fi 

# setup DB file and notary keys 
cd Perspectives-Server

if ! [ -f notary.sqlite ]
then
	python utilities/create_tables.py notary.sqlite
	grep "Start Host\|End Host" ./$1 > no_keys.txt
	python utilities/file2db.py no_keys.txt notary.sqlite
fi 

if ! [ -f notary.priv ] 
then
	bash utilities/create_key_pair.sh notary.priv notary.pub
fi 

cd ..

# setup crontab
crontab psv-admin/crontab_content

