#!/bin/bash -x

echo "/******************************************* WELCOME TO FLIP COIN SIMULATION *******************************************/"

# CONSTANT
IS_HEAD=1

#VARIABLES
headCount=0
tailCount=0

# DECLARING DICTIONARY
declare -A singletCombination

# READING FLIPPING COUNT FROM USER
read -p "Enter a number of time you want to flip a coin : " numberOfCoinFlip

# TO GET RANDOM NUMBER
function getRandom(){
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}

# COMPUTING HEADCOUNT AND TAILCOUNT THEN STORING IN DICTIONARY
if [ $numberOfCoinFlip -ne 0 ]
then
	for (( flip=1; flip<=numberOfCoinFlip; flip++ ))
	{
		result="$( getRandom )"
		if [ $result -eq $IS_HEAD ]
		then
			singletCombination[head]=$((++headCount))
		else
			singletCombination[tail]=$((++tailCount))
		fi
	}

# CALCULATING PERCENATGE OF SINGLET PERCENTAGE
	headPercentage=`echo "scale=2; $headCount*100/$numberOfCoinFlip" | bc`
	tailPercentage=`echo "scale=2; $tailCount*100/$numberOfCoinFlip" | bc`
else
	echo "Please enter the number greater then Zero"
fi

