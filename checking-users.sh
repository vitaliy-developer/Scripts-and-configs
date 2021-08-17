#!/bin/bash

# Program "Authorization check"

# This is variables for our user
userName="root"
userPass="qwerty"

# Intro
echo You entered to the program \"Authorization check\". $'\n'Persons over 18 years of age can work with this program.

# Checking your age
echo -n "Enter your age: "
read  age
if [ $age -ge 18 ]
then
	echo "You entered the program because you are $age"
else
	echo "You are not 18 years old"
	exit
fi

# Login and password input
echo "You need to log in to the program!"

echo -n "Enter your login: "
read login
#echo $login

echo -n "Enter your password: "
read -s password
#echo $password

if [ $login = $userName ] && [ $password = $userPass ]
then 
echo $'\n'"You have successfully logged in =^.^="
echo "______________________________"
echo "|___Welcome to the program___|"
echo "------Authorization check-----"
else
echo $'\n'"You entered an incorrect login or password |*.*|"
fi	
