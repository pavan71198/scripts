sudo route del -net 202.141.80.0/24 metric 600
sudo route del -net 202.141.81.0/24 metric 600
sudo route del -net 172.16.0.0/12 metric 600
ip route show
