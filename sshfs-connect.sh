#!/usr/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: source ./sshfs-connect.sh ruser@rhost:/remote/path /local/mountpoint"
else

	REMOTE_MOUNTPOINT="$1"
	LOCAL_MOUNTPOINT="$2"

	echo "Mounting..."
	! sshfs -o idmap=user "${REMOTE_MOUNTPOINT}" "${LOCAL_MOUNTPOINT}" ; err=$?
	while [ $err -ne "0" ]; do
		read -p '[press ENTER to umount]'
		echo "Umounting..."
		fusermount -u "${LOCAL_MOUNTPOINT}"; err=$?
	done

fi
