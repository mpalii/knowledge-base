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
