/system/package/update/check-for-updates  
/system/package/update/install  
/system/routerboard/print  
/system/routerboard/upgrade  

/user/set admin password="..." 

/interface/wifi/print
/interface/wifi/set wifi1 configuration.ssid="MikroTik-10BCF5-2.4GHz"  
/interface/wifi/set wifi2 configuration.ssid="MikroTik-10BCF5-5.0GHz"  

/ip/service/print  
/ip/service/disable telnet  
/ip/service/disable ftp  
/ip service/disable www-ssl
/ip/service/enable www  
/ip/service/set winbox address=192.168.88.0/24  
/ip/service/set ssh address=192.168.88.0/24  
/ip/service/set www address=192.168.88.0/24  

/ip/firewall/filter/print

/user/add name=username group=full password="strongpass"
/user/print
/user/disable admin

/system/reboot  
