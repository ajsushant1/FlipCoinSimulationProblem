#!/bin/bash -x

echo "/******************************************* WELCOME TO FLIP COIN SIMULATION *******************************************/"

# CONSTANT
IS_HEAD=1

# TO GET RANDOM VALUE
randomCheck=$((RANDOM%2))

# CHECKING HEAD OR TAIL AND DISPLAYING RESULT
if [ $randomCheck -eq $IS_HEAD ]
then
	echo "Head"
else
	echo "Tail"
fi


