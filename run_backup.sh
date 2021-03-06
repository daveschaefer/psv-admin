#!/bin/bash 

cd Perspectives-Server
python notary_util/db2file.py ../notary_backup/notary_dump.txt
cd ../notary_backup
rm notary_dump.txt.bz2
bzip2 notary_dump.txt
git add notary_dump.txt.bz2
DATE=`date`
git commit -a -m "binary backup at: $DATE"
git push origin master

