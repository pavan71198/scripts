#!/bin/bash
curl -k -sS https://agnigarh.iitg.ac.in:1442/logout\? > /dev/null
agnigarh_magic_id=$(curl -k -sS "https://agnigarh.iitg.ac.in:1442/login?" | grep -oP 'name="magic".*value="\K[^"]+')
agnigarh_keepalive_id=$(curl -k -sS -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "4Tredir=https%3A%2F%2Fagnigarh.iitg.ac.in%3A1442%2Flogin%3F&magic=$agnigarh_magic_id&username=pavan71198&password=h4ck3r%402020" https://agnigarh.iitg.ac.in:1442/login\? | grep -oP 'keepalive\?\K[^"]+')
echo $agnigarh_keepalive_id > ~/.agnigarh_login_check
agnigarh_login_check=$agnigarh_keepalive_id
while [ "$agnigarh_login_check" == "$agnigarh_keepalive_id" ]
do
	curl -k -sS https://agnigarh.iitg.ac.in:1442/keepalive\?$agnigarh_keepalive_id > /dev/null
	sleep 600s
	agnigarh_login_check=$(cat ~/.agnigarh_login_check)
done


