#!/bin/bash
curl -k -sS https://agnigarh.iitg.ac.in:1442/logout\? > /dev/null
form_redir='https://agnigarh.iitg.ac.in:1442/login?'
form_username='username'
form_password='password'
agnigarh_magic_id=$(curl -k -sS "https://agnigarh.iitg.ac.in:1442/login?" | grep -oP 'name="magic".*value="\K[^"]+')
agnigarh_keepalive_id=$(curl -k -sS -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "4Tredir=$form_redir&magic=$agnigarh_magic_id&username=$form_username&password=$form_password" https://agnigarh.iitg.ac.in:1442/login\? | grep -oP 'keepalive\?\K[^"]+')
echo $agnigarh_keepalive_id > ~/.agnigarh_login_check
agnigarh_login_check=$agnigarh_keepalive_id
while [ "$agnigarh_login_check" == "$agnigarh_keepalive_id" ]
do
	curl -k -sS https://agnigarh.iitg.ac.in:1442/keepalive\?$agnigarh_keepalive_id > /dev/null
	sleep 600s
	agnigarh_login_check=$(cat ~/.agnigarh_login_check)
done


