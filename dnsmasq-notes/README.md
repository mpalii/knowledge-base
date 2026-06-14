sudo apt update  
sudo apt install dnsmasq  
sudo systemctl status dnsmasq  
sudo nano /etc/dnsmasq.d/wireguar.conf  

```
#interface=wg0
#bind-interfaces
#listen-address=10.13.13.1

address=/home.lan/192.168.88.10
address=/p10941/10.13.13.2

# fallback DNS
server=1.1.1.1
server=8.8.8.8
```

sudo systemctl restart dnsmasq  
sudo systemctl status dnsmasq  

sudo ufw allow in on wg0 to 10.13.13.1 port 53 proto udp  
sudo ufw allow in on wg0 to 10.13.13.1 port 53 proto tcp  

sudo systemctl edit dnsmasq  

```
[Unit]
Wants=wg-quick@wg0.service
After=wg-quick@wg0.service
```

cat /etc/systemd/system/dnsmasq.service.d/override.conf   
