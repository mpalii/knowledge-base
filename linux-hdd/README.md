sudo apt update  
sudo apt install smartmontools hdparm  
lsblk  
sudo smartctl -a /dev/sdb  
sudo smartctl -i -d sat /dev/sdb  

sudo smartctl -t short -d sat /dev/sdb  
sudo smartctl -a /dev/sdb | grep -i progress  
sudo smartctl -a -d sat /dev/sdb  

sudo smartctl -t long -d sat /dev/sdb  
sudo smartctl -a /dev/sdb | grep -i progress  
sudo smartctl -a -d sat /dev/sdb  

sudo umount /dev/sdb1  
sudo udisksctl power-off -b /dev/sdb  

sudo smartctl -a /dev/sdb | grep -i temperature  
 




udisksctl mount -b /dev/sdb1  
udisksctl unmount -b /dev/sdb1  
udisksctl power-off -b /dev/sdb  
