# System install process based on Debian 12  
- Prepare bootable USB device using the image [Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso)  
- Install:
  1. Select system language: English
  2. Select location
  3. Configure locale: United Kingdom - en_GB.UTF-8
  4. Configure the keyboard: American English
  5. Configure network (The best option is to use ethernet connection)
  6. Define a hostname (some name fot the workstation)
  7. Set up users and passwords
  8. Partition disks - Manual (create ESP section 1GB, for modern SSD no need to create SWAP section, create Ext4 section with the mountpoint at "/")
  9. Configure the package manager
  10. Software selection - uncheck all packages  
- Reboot

# Add user to sudoers
`su --login root` switch to the root account  
`apt install sudo` install sudo if need  
`groups <USERNAME>` check the list of user groups before  
`usermod --append --group sudo <USERNAME>` add user to the sudo group  
`groups <USERNAME>` check the list of user groups after  
`reboot now` perform reboot from root session  

# Change ttl font size (optional)  
`sudo dpkg-reconfigure console-setup`  
UTF-8 -> Combined - Latin, ... -> Termius -> 10x18  

# Primary check  
`sudo journalctl -p 3 -b` check system issues  
In case of any bluetooth issues enabling the experimental features can help with it see [Enabling experimental features](https://wiki.archlinux.org/title/Bluetooth#Enabling_experimental_features)  

# GUI (GNOME based)
`sudo apt install gnome-core` minimal GNOME package (see the [wiki](https://wiki.debian.org/ru/Gnome))  
`sudo apt install gnome-tweaks`  
`sudo apt install gnome-shell-extension-manager`  

# GNOME configuration  
- hide redundant icons from favourite;  
- open 'Settings';  
- check the Wi-Fi connection;  
- turn off the Bluetooth;  
- change the background;
- 'Power' show battery percentage;  
- 'Display' change physical setup and apply;  
- enable and customise Night Light;  
- 'Mouse & Touchpad' change mouse and touchpad speed, enable 'Tap to Click';  
- 'Keyboard' add Input Source (language);
- 'Users' select picture;
- 'Date & Time' Time Zone;
- 'Keyboard' - View snd Customise Shortcuts - Custom Shortcuts - gnome-terminal - ctrl + alt + t;  
- Firefox - Open previous windows and tabs;
- Install following [GNOME extensions](https://extensions.gnome.org/), and add browser extension:  
 - Dash to Dock  
 - Hide Activities Button by zeten30  
 - OpenWeather
- 'Tweaks' - Top Bar - Weekday, Date, Seconds, Week Numbers;
- 'Tweaks' - Window Titlebars - Maximise, Minimise;
- 'Extension Manager' - 'Dash to Dock' - Icon size limit: 24;
- `Extension Manager` - 'OpenWeather' - Locations;  
	


# TODO move to the script section below
## dotfiles
This is a draft for the real configuration scripts  


`sudo apt install bash-completion`  

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
