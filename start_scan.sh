#!/bin/bash 

date=`date`
rate=100
timeout=10 

if [ 1 -eq `ps -Af | grep "python threaded_scanner.py" | grep -v grep | wc -l` ] 
then
	echo "ignoring request to start scan from script because scanner is already running. $date" >> logs/scanner.log
	exit 1
fi


echo "starting scan from script at $date" >> logs/scanner.log
cd Perspectives-Server
python notary_util/list_services.py | python notary_util/threaded_scanner.py --scans $rate --timeout $timeout >> ../logs/scanner.log 2>&1 &

