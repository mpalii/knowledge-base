# System install process (based on Debian 12)  
- Prepare bootable USB device using the image [Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/)  
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
**hexedit** view and edit files in hexadecimal or in ASCII  
**libreoffice** a full-featured office productivity suite  
**openjdk-17-jdk** OpenJDK Development Kit (JDK)  
**openjdk-17-source** OpenJDK Development Kit (JDK) source files  
**openjdk-17-doc** OpenJDK Development Kit (JDK) documentation  
**mvn** Apache Maven software project management and comprehension tool  

**binutils-avr** Binary utilities supporting Atmel's AVR targets  
**gcc-avr** GNU C compiler (cross compiler for avr)  
**avr-libc** Standard C library for Atmel AVR development  
**avrdude** software for programming Atmel AVR microcontrollers  
**picocom** minimal dumb-terminal emulation program  

`sudo update-alternatives --config <application>` maintain symbolic links determining default commands  

https://snapcraft.io/  
`sudo snap refresh --list`  
`sudo snap refresh`  

`sudo snap install intellij-idea-community --classic` IntelliJ IDEA Community Edition  
`sudo snap install code --classic` Visual Studio Code  
`sudo snap install spotify` Spotify  
`sudo snap install slack` Slack  

https://flathub.org/  
`flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo` add a remote repository  

`sudo flatpak install --from https://flathub.org/repo/appstream/org.kicad.KiCad.flatpakref`  
`sudo flatpak install flathub org.gnome.Calculator`  

# GNOME configuration  
- hide redundant icons from favourite;  
- open 'Settings';  
- check the Wi-Fi connection;  
- turn off the Bluetooth;  
- change the background;
- 'Power' show battery percentage;
- 'Power' - 'Autimatic Suspend' - 'Plugged In' - 'Off';  
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
- 'Nautilus' - Show Hidden Files, Icon Size (Zoom Out), List View;

# Boot check  
`sudo journalctl -p 3 -b` check system issues  
In case of any bluetooth issues enabling the experimental features can help with it see [Enabling experimental features](https://wiki.archlinux.org/title/Bluetooth#Enabling_experimental_features)  

# See also:  
- [Dotfiles – What is a Dotfile and How to Create it in Mac and Linux](https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/)  
- [Swap Space in Linux: What It Is & How It Works](https://phoenixnap.com/kb/swap-space)
- [Getting started with swap](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/managing_storage_devices/getting-started-with-swap_managing-storage-devices#overview-of-swap-space_getting-started-with-swap)
- [I have 16GB RAM. Do I need 32GB swap?](https://askubuntu.com/questions/49109/i-have-16gb-ram-do-i-need-32gb-swap)
- [What is the difference between /opt and /usr/local?](https://unix.stackexchange.com/questions/11544/what-is-the-difference-between-opt-and-usr-local)
- [/usr/bin vs /usr/local/bin on Linux](https://unix.stackexchange.com/questions/8656/usr-bin-vs-usr-local-bin-on-linux)
