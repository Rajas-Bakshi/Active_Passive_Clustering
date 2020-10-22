#!/bin/bash
read -p "This step is only for VM 1 Are you sure you want to continue ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sleep 3
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx INSTALLING KEY GENERATOR xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	apt install -y haveged
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx Installed nginx xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	corosync-keygen
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx TAKING BACKUP OF corosync.conf xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	mv /etc/corosync/corosync.conf /etc/corosync/corosync.conf.bku
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx CREATING NEW  corosync.conf xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	cp ./corosync.conf /etc/corosync/
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx Make changes in /etc/ssh/sshd_config and then run: xxxxxxxxxxxxxxxxxxxxxxxxx"
	echo "scp /etc/corosync/* root@ubuntuvm02:/etc/corosync/"
	echo "scp /etc/corosync/* root@ubuntuvm03:/etc/corosync/"
fi
