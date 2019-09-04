#Ubuntu
# sudo route del -net 202.141.80.0/24 metric 600
# sudo route del -net 202.141.81.0/24 metric 600
# sudo route del -net 172.16.0.0/12 metric 600
# ip route show

#MacOS
sudo route delete -net 192.168.0.0/16
sudo route delete -net 172.16.0.0/12
sudo route delete -net 10.0.0.0/8
netstat -nr
