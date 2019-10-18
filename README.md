# sshfs-utils
Reference: https://askubuntu.com/a/412478

## Usage:
```bash
luser@lhost:~$ source ./sshfs-connect.sh ruser@rhost:/remote/path /local/mountpoint
Mounting...
[press ENTER to umount]
Umounting...
```
For frequently used hosts:
```bash
luser@lhost:~$ mkdir /mnt/myhost
luser@lhost:~$ echo "alias sshfs-myhost=\"source $HOME/sshfs-utils/sshfs-connect.sh ruser@myhost:/remote/path /mnt/myhost\"" >> $HOME/.bashrc
luser@lhost:~$ source $HOME/.bashrc
```

## Problems:
### Already mounted
```bash
luser@lhost:~$ source ./sshfs-connect.sh ruser@rhost:/remote/path /local/mountpoint
Mounting...
fuse: mountpoint is not empty
fuse: if you are sure this is safe, use the 'nonempty' mount option

luser@lhost:~$ df -h /local/mountpoint
Filesystem                Size  Used Avail Use% Mounted on
ruser@rhost:/remote/path   10G  2,5G  7,6G  25% /local/mountpoint
```
```bash
luser@lhost:~$ fusermount -u /local/mountpoint
