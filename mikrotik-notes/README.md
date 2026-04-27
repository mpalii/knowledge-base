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
/system/shutdown  
/log/print  

GUEST wifi
/interface/bridge/print  
/interface/bridge/add name=bridge-guest  
/interface/wifi/print  
/interface/wifi/add name=wifi-guest master-interface=wifi2 configuration.ssid="MikroTik-10BCF5-guest"  
/interface/bridge/port/add bridge=bridge-guest interface=wifi-guest  
/ip/address/add address=192.168.50.1/24 interface=bridge-guest  
/ip/pool/add name=guest-pool ranges=192.168.50.10-192.168.50.20  
/ip/dhcp-server/add name=guest-dhcp interface=bridge-guest address-pool=guest-pool  
/ip/dhcp-server/network/add address=192.168.50.0/24 gateway=192.168.50.1 dns-server=8.8.8.8  
/ip/dhcp-server/enable guest-dhcp  
/ip/firewall/nat/add chain=srcnat src-address=192.168.50.0/24 action=masquerade  
/ip/firewall/filter/add chain=forward src-address=192.168.50.0/24 dst-address=192.168.88.0/24 action=drop  
/ip/firewall/filter/add chain=input src-address=192.168.50.0/24 action=drop  

/interface/wifi/security/print  
/interface/wifi/security/add name=guest-sevurity authentication-types=wpa2-psk,wpa3-psk passphrase="password"  
/interface/wifi/set wifi-guest security=guest-security  
/interface/wifi/security/set guest-security passphrase="password_new"  

/interface/wifi/enable wifi-guest

if needed  
/ip/firewall/filter/move 12 6

limit guest speed  
/queue/simple/print 
/queue/simple/add name=guest-limit target=192.168.50.0/24 max-limit=5M/5M  

🧪 Проверка

connect to:
MikroTik-Guest

Must be:
IP like 192.168.50.x
internet is working ✔
192.168.88.1 is not pinging ❌




