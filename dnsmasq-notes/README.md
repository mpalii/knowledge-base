sudo apt update  
sudo apt install dnsmasq  
sudo systemctl status dnsmasq  
sudo nano /etc/dnsmasq.d/wireguar.conf  

```
# === Local VPN DNS records (static overrides) ===
# These mappings resolve internal VPN names to private IPs
# Used only inside WireGuard network (10.13.13.0/24)

interface=wg0
bind-interfaces
listen-address=10.13.13.1

address=/home.arpa/10.13.13.2              # VPN peer or service endpoint inside WireGuard network
address=/qbittorrent.home.arpa/10.13.13.2  
address=/jellyfin.home.arpa/10.13.13.2

# === Fallback upstream DNS servers ===
# Used when requested domain is NOT defined in local zone above
# Queries are forwarded to public DNS resolvers

server=1.1.1.1   # Cloudflare DNS (primary upstream resolver)
server=8.8.8.8   # Google DNS (secondary upstream resolver)
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
