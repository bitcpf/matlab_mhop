# turn RTS off 
iwconfig wlan0 rts off 

# dump route tables 
route >> concurrentFlow_tcp_rtsOff_download_log 

# test upload of singleflow 
echo "============= DOWNLOAD ============" >> concurrentFlow_tcp_rtsOff_download_log  
./iperf -c 1.241.56.218 -t 20 -p 1086 >> concurrentFlow_tcp_rtsOff_download_log

echo >> concurrentFlow_tcp_rtsOff_download_log 
echo "==========================" >> concurrentFlow_tcp_rtsOff_download_log
echo >> concurrentFlow_tcp_rtsOff_download_log 
