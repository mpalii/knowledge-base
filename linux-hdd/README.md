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
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT,MODEL  




udisksctl mount -b /dev/sdb1  
udisksctl unmount -b /dev/sdb1  
udisksctl power-off -b /dev/sdb  



sudo mkdir -p /mnt/mydisk  
sudo mount /dev/sdb1 /mnt/mydisk  
sudo umount /mnt/mydisk  







sudo umount /dev/sdb1  
lsblk  
sudo mkfs.ext4 -L WD10TB-1 /dev/sdb1  




