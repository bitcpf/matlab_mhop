# turn RTS off 
iwconfig wlan0 rts off 

# log route tables 
route >> singleFlow_udp_rtsOff_log

# test upload of singleflow 
echo "===== DOWNLOAD MULTIHOP SINGLE FLOW========" >> singleFlow_udp_rtsOff_log  
./iperf -c 1.241.56.218 -u -t 20 -p 1024 >> singleFlow_udp_rtsOff_log

echo "===========================================" >> singleFlow_udp_rtsOff_log
echo >> singleFlow_udp_rtsOff_log 
