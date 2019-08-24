#!/bin/bash
agnigarh_login_check=$(cat ~/.agnigarh_login_check)
curl -k -sS https://agnigarh.iitg.ac.in:1442/logout\?$agnigarh_login_check > /dev/null
echo "none" > ~/.agnigarh_login_check
