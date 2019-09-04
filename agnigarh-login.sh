#!/bin/bash

#VPN users
#agnigarh_site='https://192.168.193.1:1442'

#normal users
agnigarh_site='https://agnigarh.iitg.ac.in:1442'

#logging out
curl -k -sS "$agnigarh_site/logout?" > /dev/null

#set username and sassword here
form_username='username'
form_password='password'

form_redir='$agnigarh_site/login?'
agnigarh_magic_id=$(curl -k -sS "$agnigarh_site/login?" | grep -oP 'name="magic".*value="\K[^"]+')

#logging in and getting keepalive id
agnigarh_keepalive_id=$(curl -k -sS -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "4Tredir=$form_redir&magic=$agnigarh_magic_id&username=$form_username&password=$form_password" "$agnigarh_site/login?" | grep -oP 'keepalive\?\K[^"]+')

#storing keepalive id
echo $agnigarh_keepalive_id > ~/.agnigarh_login_check

#checking if stored keepalive id and current keepalive id matches or not
agnigarh_login_check=$agnigarh_keepalive_id
while [ "$agnigarh_login_check" == "$agnigarh_keepalive_id" ]
do
	#if matches sending request to keepalive site
	curl -k -sS "$agnigarh_site/keepalive?$agnigarh_keepalive_id" > /dev/null
	#sleeping for 10min
	sleep 600s
	#retieving stored keepalive id
	agnigarh_login_check=$(cat ~/.agnigarh_login_check)
done