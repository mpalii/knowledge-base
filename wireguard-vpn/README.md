### WireGuard VPN (Hub-and-Spoke, UFW-based)  

- Classic Hub-and-Spoke overlay network;  
- No NAT (Network Address Translation);  
- No Internet access through the HUB;  
- HUB acts only as an L3 router inside the VPN.  

```
Peer1 ----\
Peer2 ----- HUB (10.13.13.1)
Peer3 ----/
```

### Preconditions (HUB / VPS)

- connect to the Linux VPS (HUB);
- `sudo apt update` update packages;  
- `sudo apt install wireguard ufw` install WireGuard;  
- `cd /etc/wireguard` go to config directory;
- `umask 077` default permissions only for owners;  
- `wg genkey | tee privatekey | wg pubkey > publickey` generate keys;  
- `sudo nano /etc/wireguard/wg0.conf` create config;  
- `rm privatekey publickey` remove temporary key files after copying keys into config.  

### 1. HUB Configuration

Create `/etc/wireguard/wg0.conf`:  

```ini
[Interface]
Address = 10.13.13.1/24
ListenPort = 51820
PrivateKey = SERVER_PRIVATE_KEY
SaveConfig = false

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

### 2. Enable Packet Forwarding (HUB)

`sudo nano /etc/sysctl.conf` enable forwarding with **net.ipv4.ip_forward=1**  
`sudo sysctl -p` apply changes  
`sudo sysctl net.ipv4.ip_forward` verify  

### 3. UFW Configuration (HUB)

`sudo ufw route allow in on wg0 out on wg0` allow routing within wg0 only  
`sudo ufw allow 51820/udp` UFW rules for WireGuard  
`sudo ufw enable` if UFW is not enabled  
`sudo ufw reload` if UFW is already enabled  
`sudo ufw status verbose` check UFW  

### 4. Peer Configuration (Client)

On each peer:

```ini
[Interface]
Address = 10.13.13.5/32
PrivateKey = PEER_4_PRIVATE_KEY

# Optional DNS (if needed)
# DNS = 10.13.13.1

[Peer]
PublicKey = SERVER_PUBLIC_KEY
Endpoint = VPN_SERVER_IP:51820
AllowedIPs = 10.13.13.0/24
PersistentKeepalive = 25
```

`sudo nano /etc/wireguard/wg0.conf` add peer to HUB (on HUB)  

```ini
[Peer]
# Peer 4
PublicKey = PEER_4_PUBLIC_KEY
AllowedIPs = 10.13.13.5/32
```

`sudo systemctl restart wg-quick@wg0` apply changes  

### 5. WireGuard Service Management  

`sudo systemctl enable wg-quick@wg0` enable autostart  
`sudo systemctl start wg-quick@wg0` start  
`sudo systemctl stop wg-quick@wg0` stop  
`sudo systemctl status wg-quick@wg0` status  
`sudo wg show` info  
`sudo ss -ulpn | grep 51820` check listening port  

### 6. Connectivity & Utilities

`ping 10.13.13.1` connectivity test (from any peer to HUB)  
`ping 10.13.13.3` connectivity test (peer-to-peer)  
`sudo apt install qrencode` QR code generator  
`qrencode -t ansiutf8 < peer.conf` generate QR from peer configuration file  

### Reference

https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-22-04
