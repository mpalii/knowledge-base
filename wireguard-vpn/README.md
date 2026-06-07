## WireGuard VPN (Hub-and-Spoke, UFW-based)

* Classic Hub-and-Spoke overlay network;
* No NAT (Network Address Translation);
* No Internet access through the HUB;
* HUB acts only as an L3 router inside the VPN.

```text id="n7p0qv"
Peer1 ----\
Peer2 ----- HUB (10.13.13.1)
Peer3 ----/
```

## Preconditions (HUB / VPS)

* connect to the Linux VPS (HUB);
* install WireGuard:

```bash
sudo apt update
sudo apt install wireguard ufw
```

* go to config directory:

```bash
cd /etc/wireguard
```

* generate keys:

```bash
wg genkey | tee privatekey | wg pubkey > publickey
```

* create config:

```bash
sudo nano /etc/wireguard/wg0.conf
```

* remove temporary key files after copying keys into config:

```bash
rm privatekey publickey
```

## 1. HUB Configuration

Create `/etc/wireguard/wg0.conf`:

```ini
[Interface]
Address = 10.13.13.1/24
ListenPort = 51820
PrivateKey = SERVER_PRIVATE_KEY
SaveConfig = false

[Peer]
# Peer 1
PublicKey = PEER_1_PUBLIC_KEY
AllowedIPs = 10.13.13.2/32

[Peer]
# Peer 2
PublicKey = PEER_2_PUBLIC_KEY
AllowedIPs = 10.13.13.3/32

[Peer]
# Peer 3
PublicKey = PEER_3_PUBLIC_KEY
AllowedIPs = 10.13.13.4/32
```

## 2. UFW Configuration (HUB)

Enable UFW and allow WireGuard:

```bash
sudo ufw allow 51820/udp
sudo ufw enable
```

Enable routing in UFW:

Edit:

```bash
sudo nano /etc/default/ufw
```

Set:

```ini
DEFAULT_FORWARD_POLICY="ACCEPT"
```

Apply:

```bash
sudo ufw reload
```

## 3. Enable Packet Forwarding (HUB)

Edit `/etc/sysctl.conf`:

```ini
net.ipv4.ip_forward=1
```

Apply:

```bash
sudo sysctl -p
```

Verify:

```bash
sysctl net.ipv4.ip_forward
```

Expected:

```text
net.ipv4.ip_forward = 1
```

## 4. Peer Configuration (Client)

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

Add peer to HUB `/etc/wireguard/wg0.conf`:

```ini
[Peer]
# Peer 4
PublicKey = PEER_4_PUBLIC_KEY
AllowedIPs = 10.13.13.5/32
```

Apply changes:

```bash
sudo systemctl restart wg-quick@wg0
```

## 5. WireGuard Service Management

Enable autostart:

```bash
sudo systemctl enable wg-quick@wg0
```

Start:

```bash
sudo systemctl start wg-quick@wg0
```

Status:

```bash
sudo systemctl status wg-quick@wg0
```

WireGuard info:

```bash
sudo wg show
```

Listening check:

```bash
sudo ss -ulpn | grep 51820
```

Stop:

```bash
sudo systemctl stop wg-quick@wg0
```

## 6. Connectivity Test

From any peer:

```bash
ping 10.13.13.1
```

Test peer-to-peer:

```bash
ping 10.13.13.3
```

Expected:

```text
Peer ↔ HUB
Peer ↔ Peer
```

## 7. Optional: QR Configuration Export

Install:

```bash
sudo apt install qrencode
```

Generate QR:

```bash
qrencode -t ansiutf8 < /etc/wireguard/wg0.conf
```

## Reference

https://www.digitalocean.com/community/tutorials/how-to-set-up-wireguard-on-ubuntu-22-04
