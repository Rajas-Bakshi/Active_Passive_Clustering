echo  "xxxxxxxxxxxxxxxxxxxxxxxx Updating packages xxxxxxxxxxxxxxxxxxxxxxxx"
chmod 777 ./*
sleep 3
sudo apt-get update
sudo apt-get upgrade -y
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Step 2 and 3 for server 1 xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3
sudo apt install -y nginx
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Installed nginx xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3

echo "xxxxxxxxxxxxxxxxxxxxx Please enter your VM Number 1/2/3? ------> "
read -p 'Enter VM number 1 or 02 or 03 -------> '  vm_number
echo "Proceeding for VM Number entered: $vm_number"
sleep 2
echo '<h1>node$vm_number - ifbd-labs</h1>' > /var/www/html/index.html

sleep 3
sudo systemctl stop nginx
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Stoped nginx xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Installing pacemaker, corosync, crmsh xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3
sudo apt install -y pacemaker corosync crmsh
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Stopping corosync and pacemaker xxxxxxxxxxxxxxxxxxxxxxxxx"
sleep 3
service corosync stop
sleep 2
service pacemaker stop
echo "xxxxxxxxxxxxxxxxxxxxxxxxx Move to Step 3 on your VM 1 xxxxxxxxxxxxxxxxxxxxxxxxx"
