#!/bin/bash
sleep 3
echo "xxxxxxxxxxxxxxxxxxxxxxxxx STEP 4 For all VMs xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3
service corosync start
service pacemaker start
echo "xxxxxxxxxxxxxxxxxxxxxxxxx CHECK 'crm status' xxxxxxxxxxxxxxxxxxxxxxxxx"
