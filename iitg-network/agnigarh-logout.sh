#!/bin/bash

#VPN users
#agnigarh_site='https://192.168.193.1:1442'

#normal users
agnigarh_site='https://agnigarh.iitg.ac.in:1442'

curl -k -sS "$agnigarh_site/logout?" > /dev/null
echo "none" > ~/.agnigarh_login_check
