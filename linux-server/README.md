'Naked' Debian 13 as a base operating system.  

First login:  
su --login root  
apt update  
apt upgrade  
apt install sudo  
apt install bash-completion  
apt install man  

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
(sudo) ufw allow from 192.168.88.0/24 to any port 22 proto tcp comment 'SSH (only from home LAN)'  
(sudo) ufw delete RULE_NUMBER  

NTP service  
timedatectl  
sudo apt install chrony  
systemctl status chrony  
chronyc tracking  
chronyc sources  
timedatectl list-timezones | grep -i "kyiv"  
sudo timedatectl set-timezone Europe/Kyiv  

REBOOT hang fix:  
sudo nano /etc/default/grub  
GRUB_CMDLINE_LINUX_DEFAULT="quiet pcie_aspm=off e1000e.SmartPowerDownEnable=0"  
