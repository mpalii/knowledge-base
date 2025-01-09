# System install process (based on Debian 12)  
- Prepare bootable USB device using the image [Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso)  
- Install:
  1. Select system language: English
  2. Select location
  3. Configure locale: United Kingdom - en_GB.UTF-8
  4. Configure the keyboard: American English
  5. Configure network (The best option is to use ethernet connection)
  6. Define a hostname (name fot the workstation)
  7. Set up users and passwords
  8. Partition disks - Manual (create ESP section 1GB, for modern SSD no need to create SWAP section, create Ext4 section with the mountpoint at "/")
  9. Configure the package manager
  10. Software selection - uncheck all packages  
- Reboot

# Primary system configuration
`su --login root` switch to the root account (or login as root initially)  

`dpkg-reconfigure console-setup` Change ttl font size (optional)  
UTF-8 -> Combined - Latin, ... -> Termius -> 10x18  

`apt update` update list of available packages  
`apt upgrade` upgrade the system by installing/upgrading packages  

`apt show {}` show package details  
`apt install {}` install packages (see below)  
**sudo** Provide limited super user privileges to specific users  
**bash-completion** programmable completion for the bash shell  

`groups <USERNAME>` check the list of user groups before  
`usermod --append --group sudo <USERNAME>` add user to the sudo group  
`groups <USERNAME>` check the list of user groups after  

`reboot now` perform reboot from root session  

//TODO bootstrap candidate  
**gnome-shell** graphical shell for the GNOME desktop (see the [wiki](https://wiki.debian.org/ru/Gnome))  
**gnome-terminal** GNOME terminal emulator application  
**gnome-tweaks** tool to adjust advanced configuration settings for GNOME  
**snapd** Daemon and tooling that enable snap packages  
**flatpak** Application deployment framework for desktop apps  
**gnome-software-plugin-flatpak** Flatpak support for GNOME Software  
**nautilus** file manager and graphical shell for GNOME  
**firefox-esr** Mozilla Firefox web browser - Extended Support Release (ESR)  
**neovim** heavily refactored vim fork; Vi IMproved - enhanced vi editor  
**tree** displays an indented directory tree, in color  
**git** fast, scalable, distributed revision control system  
**texinfo** software documentation system  
**bzip2** a block-sorting file compressor  
**curl** a tool for transfering data from or to a server  
**gedit** general-purpose text editor  
**vlc** the VLC media player  
**zathura** a document viewer  
**make** GNU make utility to maintaine groups of programs  
**gcc** GNU compiler collection  
**libreoffice** a full-featured office productivity suite  

**gcc-avr** GNU C compiler (cross compiler for avr)  
**avr-libc** Standard C library for Atmel AVR development  
**avrdude** software for programming Atmel AVR microcontrollers  
**picocom**  

`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo` add a remote repository  

`snap install code --classic` Visual Studio Code  
`snap install spotify` Spotify  

`sudo flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref`  

## GNOME configuration  
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
- 'Keyboard' - View snd Customise Shortcuts - Custom Shortcuts - gnome-terminal --window --maximize - ctrl + alt + t;  
- Firefox - Open previous windows and tabs;
- Install following [GNOME extensions](https://extensions.gnome.org/), and add browser extension:  
  - [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)  
  - [Hide Activities Button](https://extensions.gnome.org/extension/744/hide-activities-button/)  
  - [OpenWeather](https://extensions.gnome.org/extension/750/openweather/)  
- 'Tweaks' - Top Bar - Weekday, Date, Seconds, Week Numbers;
- 'Tweaks' - Window Titlebars - Maximise, Minimise;
- 'Extensions' - 'Dash to Dock' - Icon size limit: 24;
- 'Extensions' - 'OpenWeather' - Locations;
- 'Nautilus' - Show Hidden Files;

# Boot check  
`sudo journalctl -p 3 -b` check system issues  
In case of any bluetooth issues enabling the experimental features can help with it see [Enabling experimental features](https://wiki.archlinux.org/title/Bluetooth#Enabling_experimental_features)  


### TODO move to the script section below
#### dotfiles
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

`sudo apt install openjdk-17-jdk`  
`sudo apt install openjdk-17-jdk-source`  
`sudo apt install openjdk-17-jdk-doc`  
`sudo update-alternatives --config java`  
`sudo apt install maven`  
