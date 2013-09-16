#turn off RTS/CTS 
iwconfig wlan0 rts off

# log route tables
route >> linkCapacity_udp_rtsOff_log

# test upload of singleflow
echo "=========== UPLOAD ==============" >> linkCapacity_udp_rtsOff_log
./iperf -c xxx.xxx.xxx.xxx -u -t 20 -p 1024 >> linkCapacity_udp_rtsOff_log

echo >> linkCapacity_udp_rtsOff_log
echo >> linkCapacity_udp_rtsOff_log

echo "============ DOWNLOAD ============" >> linkCapacity_udp_rtsOff_log
./iperf -c xxx.xxx.xxx.xxx -u -t 20 -p 1024 >> linkCapacity_udp_rtsOff_log

echo "==========================" >> linkCapacity_udp_rtsOff_log
echo >> linkCapacity_udp_rtsOff_log
~
~
