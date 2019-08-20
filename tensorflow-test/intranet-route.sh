echo "Enter the intranet gateway: "
read gateway
sudo route add -net 202.141.80.0/24 gw $gateway metric 600
sudo route add -net 202.141.81.0/24 gw $gateway metric 600
sudo route add -net 172.16.0.0/12 gw $gateway metric 600
ip route show
