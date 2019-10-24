# [Ubuntu]
# Whole Private IP Address Space (be careful 10.8.0.0/24 range might be given to VPN)
#
# sudo route del -net 192.168.0.0/16 netmask 255.255.0.0 metric 600
# sudo route del -net 172.16.0.0/12 netmask 255.240.0.0 metric 600
# sudo route del -net 10.0.0.0/8 netmask 255.0.0.0 metric 600
#
# Only agnigarh firewall
#
sudo route del -net 192.168.193.1 netmask 255.255.255.255 metric 600
#
# Check final route settings
#
ip route show

# [macOS]
# Whole Private IP Address Space (be careful 10.8.0.0/24 range might be given to VPN)
#
# sudo route delete -net 192.168.0.0/16
# sudo route delete -net 172.16.0.0/12
# sudo route delete -net 10.0.0.0/8
#
# Only agnigarh firewall
#
# sudo route delete -net 192.168.193.1/32
#
# Check final route settings
#
# netstat -nr
