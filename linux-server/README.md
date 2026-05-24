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

REBOOT hang fix:  
sudo nano /etc/default/grub  
GRUB_CMDLINE_LINUX_DEFAULT="quiet pcie_aspm=off e1000e.SmartPowerDownEnable=0 reboot=efi,reboot=p,reboot=acpi"  
sudo update-grub  
sudo reboot  
