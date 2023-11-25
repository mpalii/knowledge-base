# System install process based on Debian 12  
- Using [Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso) section, prepare the bootable USB device
- Install
- Select system language: English
- Select location
- Configure locale: United States - en_US.UTF-8
- Configure the keyboard: American English
- Configure network (The best option is to use ethernet connection)
- Define a hostname (some name fot the workstation)
- Set up users and passwords
- Partition disks - Manual (create ESP section 1GB, for modern SSD no need to create SWAP section, create Ext4 section with the mountpoint at "/")
- Configure the package manager
- Software selection - uncheck all packages  
- Reboot

# Primary check  
`journalctl -p 3 -b` check system issues  
In case pf any bluetooth issues enabling the experimental features can help with it see [Enabling experimental features](https://wiki.archlinux.org/title/Bluetooth#Enabling_experimental_features) 



TODO move to the script section below
# dotfiles
This is a draft for the real configuration scripts  

`apt list --upgradable`  
`sudo apt update`  
`sudo apt upgrade`  

`sudo snap refresh --list`  
`sudo snap refresh`  

https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/  

https://snapcraft.io/  
`sudo snap install intellij-idea-community --classic`  
`sudo snap install slack`  
`sudo snap install spotify`  

`sudo apt install tree`  
`sudo apt install neovim`  
`sudo apt install git`  
`sudo apt install openjdk-17-jdk`  
`sudo apt install openjdk-17-jdk-source`  
`sudo apt install openjdk-17-jdk-doc`  
`sudo update-alternatives --config java`  
`sudo apt install maven`  
