#initialization script to run on all meshboxes 

#set rate limit 
iwconfig wlan0 rate 11M 

#set up iperf servers: UDP & TCP 
./iperf -su -p 5001

