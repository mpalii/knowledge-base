## WireGuard VPN  

### 1. Server configuration  
- select appropriate VPS (with correct CPU resources and billing plan);  
- perform initial configuration if needed;  
- `sudo apt install wireguard` install WireGuard with;  
- `umask 077` change the permission mask;  
- `mkdir /etc/wireguard/server` create folder for server keys;  
- `cd /etc/wireguard/server` change directory;  
- `wg genkey | tee privatekey-server | wg pubkey > publickey-server` generate private and public keys;  
- `touch /etc/wireguard/wg0.conf` create server configuration file;  
- `ip route list default` check the public network interface (can be `eth0`);  
- add the snippet below to the `wg0.conf` server configuration file:  
```
[Interface]
Address = 10.13.13.1  
ListenPort = 51820  
PrivateKey = SERVER_PRIVATE_KEY  
PostUp = iptables -A FORWARD -i eth0 -j ACCEPT  
PostUp = iptables -A FORWARD -o eth0 -j ACCEPT  
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
PostDown = iptables -D FORWARD -i eth0 -j ACCEPT  
PostDown = iptables -D FORWARD -o eth0 -j ACCEPT  
PostDown = iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE  
```
- register and start WireGuard service.  

### 2. Peer configuration (adding new peer)  
It is very bad idea to keep peer's private keys on the server side due to security reasons.  
But for the simplicity of management we can ignore this rule.  

- `mkdir /etc/wireguard/peerXX` create folder for peer XX keys;  
- `cd /etc/wireguard/peerXX` change directory;  
- `wg genkey | tee privatekey-peerXX | wg pubkey > publickey-peerXX` generate private and public keys;  
- `touch /etc/wireguard/peerXX/wg0.conf` create peer XX configuration file;  
- add the snippet below to the `/etc/wireguard/peerXX/wg0.conf` peer XX configuration file:  
```
[Interface]  
Address = 10.13.13.2  
PrivateKey = PEER_XX_PRIVATE_KEY  
ListenPort = 51820  
DNS = 8.8.8.8  

[Peer]
PublicKey = SERVER_PUBLIC_KEY  
Endpoint = VPN_SERVER_IP:51820  
AllowedIPs = 0.0.0.0/0  
```
Adjust server configuration file `/etc/wireguard/wg0.conf` with the newly created peer XX information:  
```
[Interface]  
Address = 10.13.13.1  
ListenPort = 51820  
PrivateKey = SERVER_PRIVATE_KEY  
PostUp = iptables -A FORWARD -i eth0 -j ACCEPT  
PostUp = iptables -A FORWARD -o eth0 -j ACCEPT  
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
PostDown = iptables -D FORWARD -i eth0 -j ACCEPT  
PostDown = iptables -D FORWARD -o eth0 -j ACCEPT  
PostDown = iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE  

[Peer]  
# Some new peer description  
PublicKey = PEER_XX_PUBLIC_KEY  
AllowedIPs = 10.13.13.2/32  
```

### 3. Enable packet forwarding  
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

### 4. Configuration pulling  
`sudo apt install qrencode`  utility to generate QR code  
`qrencode -t ansiutf8 < /etc/wireguard/peerXX/wg0.conf` to generate QR code with configuration for peer XX  

`sudo wg-quick up wg0`  
`sudo wg-quick down wg0`  
