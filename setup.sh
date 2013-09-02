#!/bin/bash 

if ! [ -d logs ] 
then 
	mkdir logs
fi 

# on launch db and key pair are automatically created if necessary

# setup crontab
crontab psv-admin/crontab_content

