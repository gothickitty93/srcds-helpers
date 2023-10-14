#!/bin/bash
clear
echo Running gamename Reports...
sleep 3
echo 
echo gamename Player Reports Below:
echo
cat /path/to/server/addons/sourcemod/configs/playerreport_logs.txt
echo 
cat /path/to/server/addons/sourcemod/logs/vote_kick.log
echo gamename Ban Reports Below:
echo 
cat /path/to/server/addons/sourcemod/logs/lilac.log
echo
cat /path/to/server/addons/sourcemod/logs/SMAC.log
echo -------
echo
echo End of reports.
