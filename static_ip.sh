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
echo Let\'s continue
break
else
echo You have 4 attempts. Used $i\.
fi
done
# Exit 1 
if [ $ready != yes ]
then
echo "Goodbye."
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
echo $device
if ls -l /etc/sysconfig/network-scripts/$device
then
echo "Config before change: " 
cat /etc/sysconfig/network-scripts/$device
checkNetworks=$(($varNetworks + $device))
#echo  $checkNetworks
break
else
echo "You entered the wrong name of the network device (*-*)"
fi
done

# Exit 2
if [ $checkNetworks != $checkNetworks ]
then
echo "Goodbye."
exit
fi

echo "+++++++++++++++++++++++++"
echo "|...Vitaliy, welcome!...|"
echo "+++++++++++++++++++++++++"

