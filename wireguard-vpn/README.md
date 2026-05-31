## WireGuard VPN  

Classic Hub-and-Spoke “overlay network” (no NAT, no access to the internet through the HUB).  

### 0. Preconditions  
- connect to the appropriate linux machine (VPS for HUB);  
- perform initial configuration if needed;  
- `sudo apt install wireguard` install WireGuard with;  
- `touch /etc/wireguard/wg0.conf` create server configuration file;
- `cd /etc/wireguard`;  
- `wg genkey | tee privatekey | wg pubkey > publickey` generate private and public keys;  

### 1. HUB configuration  
- `ip route list default` check the public network interface (can be `eth0`);  
- add the snippet below to the `wg0.conf` configuration file:  
```
[Interface]
Address = 10.13.13.1/24  
ListenPort = 51820  
PrivateKey = SERVER_PRIVATE_KEY  
PostUp = iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT
PostUp = iptables -A FORWARD -o wg0 -j ACCEPT
PostDown = iptables -D FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT
PostDown = iptables -D FORWARD -o wg0 -j ACCEPT 

[Peer]  
# Peer 1 description
PublicKey = PEER_1_PUBLIC_KEY 
AllowedIPs = 10.13.13.2/32  

[Peer]
# Peer 2 description
PublicKey = PEER_2_PUBLIC_KEY 
AllowedIPs = 10.13.13.3/32

[Peer]
# Peer 3 description
PublicKey = PEER_3_PUBLIC_KEY 
AllowedIPs = 10.13.13.4/32
```
- register and start WireGuard service.  

### 2. Peer configuration (adding new peer)  
- add the snippet below to the `/etc/wireguard/wg0.conf` peer configuration file:  
```
[Interface]  
Address = 10.13.13.5/24  
PrivateKey = PEER_4_PRIVATE_KEY
# DNS address is optional
#DNS = 8.8.8.8  

[Peer]
PublicKey = SERVER_PUBLIC_KEY  
Endpoint = VPN_SERVER_IP:51820  
AllowedIPs = 10.13.13.1/24  
PersistentKeepalive = 25
```
Adjust HUB configuration file `/etc/wireguard/wg0.conf` with the newly created peer XX information:  
```
[Interface]  
...

[Peer]  
# Some new peer description  
PublicKey = PEER_4_PUBLIC_KEY  
AllowedIPs = 10.13.13.5/32  
```

### 3. HUB - enable packet forwarding  
Uncomment the line (remove dash):  
`#net.ipv4.ip_forward=1`  
in the `/etc/sysctl.conf`  

And set the parameter:  
`echo 1 > /proc/sys/net/ipv4/ip_forward`  

### 4. WireGuard service manipulation  
Register service (enable service):  
`systemctl enable wg-quick@wg0`  

Start service:  
`systemctl start wg-quick@wg0.service`  

Show info:  
`wg show`  

Check service:  
`sudo systemctl status wg-quick@wg0.service`  

Stop service:  
`sudo systemctl stop wg-quick@wg0.service`  

### 5. Configuration pulling  
`sudo apt install qrencode`  utility to generate QR code  
`qrencode -t ansiutf8 < /etc/wireguard/peerXX/wg0.conf` to generate QR code with configuration for peer XX  

`sudo wg-quick up wg0`  
`sudo wg-quick down wg0`  

NOTE:  
https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-22-04  
