#!/bin/bash
# Installing a static address on CentOS 7

# Intro
echo "...WARNING... This script is executed from under the ROOT!"
echo "Hello user, we will install the ip statically instead of the dynamic one."

# Cycle 1
for (( i=1; i<=4; i++ ))
do
echo -n "Are you ready, yes or no: "
read ready
if [ $ready = yes ]
then
echo  ++++++++++++++++
echo \|Let\'s continue\|
echo  ++++++++++++++++
break
else
echo Invalid input. Attempt: \№ $i
fi
done

# Exit 1 
if [ $ready != yes ]
then
echo -e "\n"
echo "++++++++++"
echo "|Goodbye.|"
echo "++++++++++"
exit
fi

# List of network devices
echo "List of network devices:"
cd /etc/sysconfig/network-scripts/
varNetworks=$(/etc/sysconfig/network-scripts/)
ls -l ifcfg-*

# Cycle 2
for (( b=1; b<=3; b++ ))
do
echo -n "Please enter the name of the network device: "
read device
# echo $device
if ls -l /etc/sysconfig/network-scripts/$device
then
# echo -e "\n"
# echo "++++++++++++++++++++++++"
# echo "|Config before change: |"
# echo "++++++++++++++++++++++++"
# cat /etc/sysconfig/network-scripts/$device
checkNetworks=$(($varNetworks + $device))
# echo  $checkNetworks
break
else
echo "Incorrect input, enter again!"
fi
done

# Exit 2
if [ $checkNetworks != $checkNetworks ]
then
echo -e "\n" 
echo "++++++++++"
echo "|Goodbye.|"
echo "++++++++++"
exit
fi
echo  ++++++++++++++++
echo \|Let\'s continue\|
echo  ++++++++++++++++

# ---
sed -i 's/BOOTPROTO=dhcp/BOOTPROTO=static/g' /etc/sysconfig/network-scripts/$device

# ---
echo -n "Please enter a new IP address: "
read address

sed -i "4a\IPADDR=${address}" /etc/sysconfig/network-scripts/$device

sed -i '5a\NETMASK=255.255.255.0' /etc/sysconfig/network-scripts/$device

sed -i 's/IPV6INIT=yes/IPV6INIT=no/g' /etc/sysconfig/network-scripts/$device

echo On $device installed new static IP: $address
echo ---------------------------------------------------------------
# cat /etc/sysconfig/network-scripts/$device
echo "----------------------------------------------"
echo "|...WARNING... Restarting the network service|"
echo "----------------------------------------------"
echo "If you are using SSH then use a new IP: $address"
systemctl restart network
