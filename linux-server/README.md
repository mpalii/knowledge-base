'Naked' Debian 13 as a base operating system.  

First login:  
su --login root  
apt update  
apt upgrade  
apt install sudo  
apt install bash-completion  
apt install man  
apt install tree  

Add user:  
(sudo) adduser USERNAME  
(sudo) usermod --append --groups sudo USERNAME  
id USERNAME  
getent passwd USERNAME  

Delete user:  
(sudo) pkill -u USERNAME  
(sudo) userdel --remove USERNAME  
id USERNAME  
getent passwd USERNAME  

Delete group:  
getent group  
(sudo) groupdel USERNAME  

SSH  
(sudo) apt install openssh-server  
systemctl status ssh  
(sudo) systemctl enable ssh  
(sudo) systemctl start ssh  
ip address  
hostname --all-ip-addresses  
ssh USERNAME@IP_ADDRESS  

FIREWALL  
(sudo) apt install ufw  
(sudo) ufw version  
(sudo) ufw status  
(sudo) ufw status verbose  
(sudo) ufw status numbered  
(sudo) ufw default deny incoming  
(sudo) ufw default allow outgoing  
(sudo) ufw allow ssh  
(sudo) ufw enable  
(sudo) ufw allow from 192.168.88.0/24 to any port 22 proto tcp comment 'OpenSSH (only from home LAN)'  
(sudo) ufw delete RULE_NUMBER  

NTP service  
timedatectl  
sudo apt install chrony  
systemctl status chrony  
chronyc tracking  
chronyc sources  
timedatectl list-timezones | grep -i "kyiv"  
sudo timedatectl set-timezone Europe/Kyiv  

TORRENT service  
sudo apt install qbittorrent-nox  
sudo adduser --system --group qbittorrent  
id qbittorrent  
sudo mkdir -p /srv/qbittorrent/{downloads,incomplete,config}  
sudo chown -R qbittorrent:qbittorrent /srv/qbittorrent  
sudo nano /etc/systemd/system/qbittorrent.service  
```  
[Unit]
Description=qBittorrent Daemon
After=network.target

[Service]
User=qbittorrent
Group=qbittorrent
ExecStart=/usr/bin/qbittorrent-nox --webui-port=8094 --profile=/srv/qbittorrent/config
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
sudo systemctl daemon-reload  
sudo systemctl enable --now qbittorrent  
sudo systemctl status qbittorrent  
sudo systemctl daemon-reload (if needed)  
sudo systemctl restart qbittorrent (if needed)  
sudo ufw allow from 192.168.88.0/24 to any port 8094 proto tcp comment 'qBittorrent (only from home LAN)'  
Options -> Connection -> Use UPnP / NAT-PMP port forwarding from my router - DISABLE  
Options -> WebUI -> Web User Interface (Remote control) -> IP Address - 192.168.88.10  
Options -> WebUI -> Authentication -> Bypass authentication for clients on localhost - DISABLE  

MEDIA server  
sudo apt install curl gpg apt-transport-https  
curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg  
echo "deb [signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian trixie main" | sudo tee /etc/apt/sources.list.d/jellyfin.list  
sudo apt update  
sudo apt install jellyfin  
sudo systemctl status jellyfin  
sudo ufw allow from 192.168.88.0/24 to any port 8096 proto tcp comment 'Jellyfin LAN'  

REVERSE PROXY   
sudo apt install caddy  
sudo systemctl enable --now caddy  
sudo systemctl status caddy  
Make DNS record for routing to your server  
sudo nano /etc/caddy/Caddyfile  
```
{
    auto_https off
}

:80 {
#    root * /usr/share/caddy
    root * /var/www/home
    file_server

    # redirects for clean URLs
    redir /torrent /torrent/ 308
    redir /media /media/ 308

    handle_path /torrent/* {
        reverse_proxy 192.168.88.10:8094
    }

    handle_path /media/* {
        reverse_proxy 127.0.0.1:8096
    }
}
```
sudo caddy validate --config /etc/caddy/Caddyfile  
sudo systemctl restart caddy  
sudo ss -tulpn | grep :80  
sudo ufw allow 80/tcp comment 'Caddy HTTP'  
sudo ufw status verbose  

HTTP SERVER home page    
sudo mkdir -p /var/www/home  
sudo nano /var/www/home/index.html  
```
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Server</title>

<style>
:root {
    --bg: #111827;
    --panel: #1f2937;
    --panel-hover: #374151;
    --text: #f3f4f6;
    --muted: #9ca3af;
    --border: #4b5563;
    --accent: #2563eb;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: var(--bg);
    color: var(--text);
    font-family: system-ui, sans-serif;
    min-height: 100vh;
}

.container {
    max-width: 900px;
    margin: 0 auto;
    padding: 48px 24px;
}

h1 {
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 32px;
}

.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 16px;
}

.card {
    display: block;
    text-decoration: none;
    color: inherit;
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 24px;
    transition: 0.15s ease;
}

.card:hover {
    background: var(--panel-hover);
    border-color: var(--accent);
}

.card-title {
    font-size: 1.1rem;
    font-weight: 600;
    margin-bottom: 8px;
}

.card-desc {
    color: var(--muted);
    font-size: 0.95rem;
    line-height: 1.4;
}

.footer {
    margin-top: 48px;
    padding-top: 16px;
    border-top: 1px solid var(--border);
    color: var(--muted);
    font-size: 0.9rem;
}
</style>
</head>

<body>
<div class="container">

<h1>Home Server</h1>

<div class="grid">

<a class="card" href="/torrent/">
    <div class="card-title">qBittorrent</div>
    <div class="card-desc">
        Torrent client and download management.
    </div>
</a>

<a class="card" href="/media/">
    <div class="card-title">Jellyfin</div>
    <div class="card-desc">
        Media library and streaming server.
    </div>
</a>

</div>

<div class="footer">
    Debian · ThinkCentre M720q
</div>

</div>
</body>
</html>
```

REBOOT hang fix:  
sudo nano /etc/default/grub  
GRUB_CMDLINE_LINUX_DEFAULT="quiet pcie_aspm=off e1000e.SmartPowerDownEnable=0 reboot=efi,reboot=p,reboot=acpi"  
sudo update-grub  
sudo reboot  

https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu  
