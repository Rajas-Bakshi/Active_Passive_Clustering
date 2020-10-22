#!/bin/bash
read -p "This step is only for VM 1 Are you sure you want to continue ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sleep 3
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx Disabling STONITH and ignore the Quorum policy xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	crm configure property stonith-enabled=false
	crm configure property no-quorum-policy=ignore
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx Adding Resourses to the cluster xxxxxxxxxxxxxxxxxxxxxxxxx"
	sleep 3
	crm configure primitive virtual_ip ocf:heartbeat:IPaddr2 params ip="10.0.2.100" cidr_netmask="32" op monitor interval="10s" meta migration-threshold="10"
	crm configure primitive webserver ocf:heartbeat:nginx configfile=/etc/nginx/nginx.conf op start timeout="40s" interval="0" op stop timeout="60s" interval="0" op monitor interval="10s" timeout="60s" meta migration-threshold="10"
	read "Name of the group " name
	sudo crm configure group $name virtual_ip webserver
	echo "xxxxxxxxxxxxxxxxxxxxxxxxx check 'crm resource show' xxxxxxxxxxxxxxxxxxxxxxxxx"
fi
