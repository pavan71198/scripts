echo "Enter the intranet gateway: "
read gateway
# [Ubuntu]
# Whole Private IP Address Space (be careful 10.8.0.0/24 range might be given to VPN)
#
# sudo route add -net 192.168.0.0 netmask 255.255.0.0 gw $gateway metric 600
# sudo route add -net 172.16.0.0 netmask 255.240.0.0 gw $gateway metric 600
# sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw $gateway metric 600
#
# Only agnigarh firewall
#
sudo route add -net 192.168.193.1 netmask 255.255.255.255 gw $gateway metric 600
#
# Check final route settings
#
ip route show

# [macOS]
# Whole Private IP Address Space (be careful 10.8.0.0/24 range might be given to VPN)
#
# sudo route add -net 192.168.0.0/16 $gateway
# sudo route add -net 172.16.0.0/12 $gateway
# sudo route add -net 10.0.0.0/8 $gateway
#
# Only agnigarh firewall
#
# sudo route add -net 192.168.193.1/32 $gateway
#
# Check final route settings
#
# netstat -rn
