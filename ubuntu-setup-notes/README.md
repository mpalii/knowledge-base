### UBUNTU primary setup and configuration  

1. Create bootable USB flash drive using Rufus (see [Download Rufus](https://rufus.ie/en/ "Download Rufus")) and Ubuntu ISO file (see [Download Ubuntu Desktop](https://ubuntu.com/download/desktop "Download Ubuntu Desktop"))   
2. Before Ubuntu installation  
	- plug in bootable USB flash drive;  
	- enter BIOS setup utility (use F10, F2, F12, F1, or DEL);  
	- in boot options change the boot order and make USB flash drive as a primary option;  
	- save changes, exit, wait till Ubuntu installation begin.  
3. Ubuntu installation	
	- select keyboard layout - English (United States);  
	- connect to Wi-Fi;  
	- select 'Minimal installation' without other options;  
	- use 'Something else' in 'Installation type';  
	- use appropriate device with 'ext4' file system;  
	- format the partition and specify mount point as "/";  
	- choose region and define the credentials ('Who are you?' form);  
	- finish the installation, restart the system, and eject USB flash drive.    
4. Primary system configuration  
	- open 'Settings';  
	- check the Wi-Fi connection;  
	- turn off the Bluetooth;  
	- change the background;  
	- 'Appearance' tab: dark mode, 'Show Personal Folder' off, 'Auto-hide the Dock' on, 'Panel mode' off, 'Icon size' 30;  
	- 'Display' change physical setup and apply;  
	- enable and customise Night Light;  
	- 'Mouse & Touchpad' change mouse and touchpad speed;  
	- 'Keyboard' add Input Source (language);  
	- 'Region & Language' - 'Formats' - 'United Kingdom';  
	- download all updates from 'Software Updater' and 'Ubuntu Software';  
	- Restart the system;  
	- `sudo apt update`;  
	- `sudo apt upgrade`;  
	- `sudo apt autoremove`;  
	- download Google Chrome browser and install with the command `sudo dpkg -i google-chrome-stable_current_amd64.deb`;  
	- `sudo apt install ubuntu-restricted-extras`;  
	- `sudo apt install vlc`;  
	- `sudo apt install preload`;  
	- Firefox `about:config`, `layers.acceleration.force-enabled` set true, `gfx.webrender.all` set true;  
	- `sudo apt install gnome-shell-extensions`, go to https://extensions.gnome.org/ and install browser extension.  

[20 Things You MUST DO After Installing Ubuntu 20.04 (Right Now!)](https://www.youtube.com/watch?v=GrI5c9PXS5k "20 Things You MUST DO After Installing Ubuntu 20.04 (Right Now!)")  
[22 Things You MUST DO After Installing Ubuntu 22.04 LTS (JAMMY JELLY FISH)](https://www.youtube.com/watch?v=CRXbjLbepqc "22 Things You MUST DO After Installing Ubuntu 22.04 LTS (JAMMY JELLY FISH)")  
[Ubuntu 22.04 Customization | 01](https://www.youtube.com/watch?v=lXIb-1_H-mA "Ubuntu 22.04 Customization | 01")  
