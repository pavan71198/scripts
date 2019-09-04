echo "Enter the intranet gateway: "
read gateway
#Ubuntu
# sudo route add -net 192.168.0.0/16 gw $gateway metric 600
# sudo route add -net 172.16.0.0/12 gw $gateway metric 600
# sudo route add -net 10.0.0.0/8 gw $gateway metric 600
# ip route show

#MacOS
sudo route add -net 192.168.0.0/16 $gateway
sudo route add -net 172.16.0.0/12 $gateway
sudo route add -net 10.0.0.0/8 $gateway
netstat -rn