## GIT notes:

### 1. Download, install and configuration.
* Download and install [GIT](https://git-scm.com/download "Git - Downloads")
* To configure SSH  connection with remote repository follow the next steps: 
	- Execute next command to generate SSH pair of public and private keys:  
	`ssh-keygen -t rsa -C "username@email.com"`
	- Files **id_rsa** and **id_rsa.pub** will be generated in *~/.ssh* folder
	- Send public key **id_rsa.pub** to repository owner
* Configure contributor information:
	- Configure username and email on global level:  
	`git config --global user.name "globalUserFirstName globalUserLastName"`  
	`git config --global user.email "globalUser@email.com"`
	- To set custom user name and email for specific project move to the project folder and set values:  
	`git config --local user.name "localUserFirstName localUserLastName"`  
	`git config --local user.email "localUser@email.com"`  
	or without `--local` flag  
	`git config user.name "localUserFirstName localUserLastName"`  
	`git config user.email "localUser@email.com"`
