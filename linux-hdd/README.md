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



FOR DESKTOP
udisksctl mount -b /dev/sdb1  
udisksctl unmount -b /dev/sdb1  
udisksctl power-off -b /dev/sdb  


FOR SERVER
sudo mkdir -p /mnt/mydisk  
sudo mount /dev/sdb1 /mnt/mydisk  
sudo umount /mnt/mydisk  







sudo umount /dev/sdb1  
lsblk  
sudo mkfs.ext4 -L WD10TB-1 /dev/sdb1  



lsblk -f  
sudo nano /etc/fstab  
# WD10TB-B00NSUWD  
UUID=bc869bc3-3ccf-4d35-9f05-755683fd833a  /mnt/WD10TB-B00NSUWD  ext4  defaults,nofail  0  2  
sudo mount -a  
df -h  
mount | grep storage  




