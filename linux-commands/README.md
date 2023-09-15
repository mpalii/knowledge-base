# Linux commands

`uptime` tell how long the system has been running  
`uname -a` print system information  
`lscpu` display information about the CPU architecture  
`echo $PATH` print PATH environment variable  
`printenv PATH` print PATH environment variable  
`printenv` print all or part of environment  
 ctr + alt + F3 (F4, F5, F6) - switch to terminal mode (tty)  
 ctr + alt + F2 - back to graphical mode  
 ctr + alt + F1 - back to logins screen to graphical mode  

 `<cmd> --help ` command documentation (help)  

`man man` refference manual for manual  
`man <cmd(utility)>` system reference manual utility  
`man -k <keyword>' search manual with keyword  

`info info` iformation about information utility  
`info <cmd(utility)> read Info documents  

`whatis <cmd(utility)>` display one-line manual page  
`whereis <cmd(utility)>` locate the binary, source, and manual page files for command  
`which <cmd(utility)>` locate a command  

`ps` reposrt the snapshot of the current processes  

`<cmd>` the command occupies the terminal window until it completes, this is a foreground job  
`<cmd> &`  the command runs without occupying the terminal window, this is a background job  
`jobs` list all jobs  
`bg %n` places the current or specified job in the background, where n is the job ID  
`fg %n` brings the current or specified job into the foreground, where n is the job ID  

ctrl + c - terminate the foreground job  
ctrl + z - stops the foreground job and places it in the background as a stopped job  

`pwd` print working directory  

`ls` list current directory content  
`ls ~` list HOME  
`l` alias for 'ls -CF'  
`l <path>` list for path  
`ls -l` ~ with long info  
`ls -r` ~ reverse order  
`ls -p` ~ append / indicator to directories  
`ls -a` ~ do not ignore entries starting with .  
`ls -A` ~ do not list implied . and ..  

`cd <path>` change directory  
`cd ..` jump to upper directory  
`cd ~` jump HOME  
`cd /` jump to the root  

`clear` clear the terminal screen  

`cat [FILE]` concatenate files and print out on the standard output  
`more [FILE]` file perusal filter for crt viewing  
`less [FILE]` opposite of `more` with more festures  

`touch <FILE1> <FILE2> ...` change file timestamp, a FILE argument that does not exist is created empty  
`mkdir <DIR1> <DIR2> ...` make directories  
`mkdir -p <DIR1>/<DIR2>/<DIR3` make parent directories as needed  
`cp <SRC1> <SRC2> ... <DIR>` copy files and directories  
`mv <SRC> <DEST>` move (rename) files  

`rm <FILE>` remove files or directories  
`rm <PATH>/*` remove all files in directory  
`rm <PATH>/*.txt` remove all files in directory with '.txt' extention  
`rm <PATH>/test.*` remove all files in directory started with 'test.' prefix  
`rm -d <PATH>` remove folder  

`ln` make links between files (hard)  
`ln -s` make symbolic links instead of hard links  

`find` find for files in a directory hierarchy  
`find . -type f -name "*.txt"` find all files in the current directory with '.txt' extension  
`find . -type f -iname "main*"` find all files in the current directory with 'main' prefix, ignore case  
`find . -type f -perm 0664` find all files in the current directory with 664 permissions  
`find . -type f -size -1M` find all files in the current directory with size less than 1 megabyte  
`find . -type d -size +1k` find all directories in the current directory with size greater than 1 kilobyte  
`find . -type f -not -iname "*.txt"` find all files in the current directory with the extention NOT '.txt', ignore case  

`wc [FILE]` print newline, word, and byte counts for each file  

`sort [FILE]...` sort lines of text files  
`sort file.txt > fileCopy.txt` sort lines of 'file.txt' and save result to 'fileCopy.txt'  
`sort -n [FILE]` sort lines of file as numbers  
`sort -r [FILE]` sort lines of file in reverse order  

`cut [FILE]` remove sections from each line of files  

`grep` print lines that match patterns  
`grep "some text" file.txt` print lines from file.txt that contain "some text"  
`grep "text" file1.txt file2.txt` print lines from file1.txt and file2.txt that contains "text"  
`grep -n "text" test.txt"` print lines and line number from test.txt that contains "text"  
`grep -n -i "tEXt" file.txt` print lines and line number from file.txt that contains "text", ignore case  

`>` redirect stdout to the new file  
`>>` redirect stdout and concatenate to the file  
`2>` redirect stderr to the new file  
`2>>` redirect stderr and concatenate to the file  
`&>` redirect all OUTs to the new file  
`&>>` redirect all OUTs and concatenate to the file  
`2> /dev/null` redirect stderr to nowhere  
`<` input stream  

`find . -type f -iname "*.cpp" -exec grep -i -n "main*" {} +` find files with 'cpp' extention and search for 'main*' in them   

`sudo <cmd>` execute command as the superuser or another user  
`sudo su` execute command 'switch user' as a superuser  
`sudo su <USER>` switch user to another user  
`su mpalii` switch user to 'mpalii'  

`!!` take content of a previous command  

`chown [OWNER]:[GROUP] <FILE>` change file owner and group  
`chmod [MODE] <FILE>` change file mode bits (000, 666, 664 etc.)  

`apt [CMD]` high-level commandline interface for the package management system  

`apt-get [CMD]` APT package handling utility  
`apt-get install <application>` install application and dependencies  
`apt-get remove <application>` remove application and dependencies  
`apt-get update` retrieve new list of packages  
`apt-get upgrade` perform an upgrade  

`apt-cache [CMD]` query the APT cache (does not manipulate the state of the system)  
`apt-cache policy <package>` show policy settings  
`apt-cache search <name pattern>` search the package list  

`add-apt-repository` adds a repository into the /etc/apt/sources.list or /etc/apt/sources.list.d or removes an existing one  

`top` display Linux processes  

`free` display amount of free and used memory in the system  
`free -h` ~ automatically scaled values  

`ps` report a snapshot of the current processes  
`ps -aux` ~ all  

`tree` list contents of directories in a tree-like format  

`tar` an archiving utility  
`tar -cf archive.tar foo bar` create archive.tar wrapper from files foo and bar  
`tar -tf archive.tar` list all files in archive.tar  
`tar -xf archive.tar` extract all files from archive.tar  

`xz archive.tar` compress archive.tar  
`unxz archive.tar.xz` decompress archive.tar  

`gzip archive.tar` compress archive.tar  
`gunzip archive.tar.gz` decompress archive.tar  
`gzip -d archive.tar.gz` decompress archive.tar  

`bzip2 archive.tar` compress archive.tar  
`bunzip2 archive.tar.bz2` decompress archive.tar  
`bzip2 -d archive.tar.bz2` decompress archive.tar  

`zip -r archive.zip folder` compress folder to archive.zip  
`unzip archive.zip` decompress archive.zip  

`wget [URL]` network downloader  

`dpkg` package manager fot Debian  
`dpkg --install [downloaded package].deb` install package  
`dpkg --remove [application name]` remove package/app  

`ping [URL]` send ICMP(Internet Control Message Protocol) ECHO_REQUEST to network hosts  
`ping -c 2 [URL]` ~ 2 times  

`host [URL]` DNS lookup utility  

`netstat` print network connections, routing tables, interface statistics, masquerade connections, and multicast membership  
`ifconfig` configure a network interface  
`ip` show/manipulate routing, network devices, interfaces and tunnels  
`route` show/manipulate the IP routing table  
`ssh` OpenSSH remote login client  
`ufw allow 22` open port 22  

`w` show who is logged on and what they are doing  
