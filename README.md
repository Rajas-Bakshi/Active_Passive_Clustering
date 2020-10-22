# Active_Passive_Clustering

### Step 1
#####Set root password will following commands:
```console
$sudo passwd root
```
*Note : Do not forget the password*

#####You can confirm changes by using the command below
```console
$su -
```
#####Enable **root** login for SSH in `/etc/ssh/sshd_config`
Find `PermitRootLogin without-password` under `Authentication` and replace it with `PermitRootLogin yes`

#####Add all host names under `/etc/hosts` as shown in below figure. 

![Image](https://github.com/Rajas-Bakshi/Active_Passive_Clustering/blob/main/Images/Hosts.PNG?raw=true)

#####Switch to super user by using command 
```
$Sudo su
```

### Step 2
Run the shell file step_2 by `sh step_2.sh`

*Note: Run on all VMs*

This file will install and configure following things:
* Nginx web serve
* Replace the default page of Nginx with a unique page
* Stop the web serve
* Install pacemaker 
* Install corosync 
* Install crmsh

This step will ask you to enter you VM number in order to Replace the default page of Nginx with a unique page
Please see the below image for your reference.
![Image](https://github.com/Rajas-Bakshi/Active_Passive_Clustering/blob/main/Images/Hosts.PNG?raw=true)


### Step 3 
Run the shell file step_3 by `./step_3.sh`

*Note: Run on VM 1 only*

This file will install and configure following things:
* Download haveged
* Generate Corosync key 
* Take backup of default configuration file
* Replace it with new [config file](https://github.com/Rajas-Bakshi/Active_Passive_Clustering/blob/main/corosync.conf)

Once the above script has completed its operation copy the keys and other configuration files to VMs using scp(root user)
The same can be done using below command..
```
$scp /etc/corosync/* root@ubuntuvm02:/etc/corosync/
```

 ### Step 4 
Run the shell file step_4 by `./step_4.sh`

*Note: Run on all VMs*

This file will install and configure following things:
* Start corosync
* Start pacemaker

Now check the crm status with `crm status` it should look like image below:
![Image](https://github.com/Rajas-Bakshi/Active_Passive_Clustering/blob/main/Images/Hosts.PNG?raw=true)
