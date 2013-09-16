# turn RTS on 
iwconfig wlan0 rts 1000 

# turn RTS off
iwconfig wlan0 rts off

# log route tables
route >> concurrentFlow_tcp_rtsOn_download_log 

# test upload of flow
echo "=========== DOWNLOAD ==============" >> concurrentFlow_tcp_rtsOn_download_log 
./iperf -c 1.241.56.218 -t 20 -p 1085 >> concurrentFlow_tcp_rtsOn_download_log 

echo >> concurrentFlow_tcp_rtsOn_download_log 

echo "==========================" >> concurrentFlow_tcp_rtsOn_download_log 
echo >> concurrentFlow_tcp_rtsOn_download_log 
echo >> concurrentFlow_tcp_rtsOn_download_log 
