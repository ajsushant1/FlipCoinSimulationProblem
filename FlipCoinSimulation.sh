#!/bin/bash -x

echo "/******************************************* WELCOME TO FLIP COIN SIMULATION *******************************************/"

# CONSTANT
IS_HEAD=1
TRIPLET=3

#VARIABLES
numberOfFlip=0

# DECLARING DICTIONARY
declare -A tripletCombination

# READING FLIPPING COUNT FROM USER
read -p "Enter a number of time you want to flip a coin : " numberOfCoinFlip

# TO GET RANDOM NUMBER
function getRandom(){
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}

# CONDITION TO CHECK NUMBER OF FLIP IS NOT EQUAL TO ZERO
if [ $numberOfCoinFlip -ne 0 ]
then
# FUNCTION TO CREATE A COMBINATION
	function getCombination(){
   local numberOfCoin=$1
	echo "$numberOfCoin"
		for (( flip=1; flip<=numberOfCoinFlip; flip++ ))
		{
			coinSide=""
			for (( coin=1; coin<=numberOfCoin; coin++ ))
			{
				result="$( getRandom )"
				if [ $result -eq $IS_HEAD ]
				then
					coinSide+=H
				else
					coinSide+=T
				fi
			}
			tripletCombination[$coinSide]=$((${tripletCombination[$coinSide]}+1))
		}
	}

# FUNCTION TO CALCULATE PERCENATGE OF COMBINATION
	function calculatePercentage(){
		for key in ${!tripletCombination[@]}
		do
			tripletCombination[$key]=`echo "scale=2; ${tripletCombination[$key]}*100/$numberOfCoinFlip" | bc`
		done
	}

# FUNCTION CALL TO GET COMBINATION AND PERCENTAGE OF COMBINATION
	getCombination $TRIPLET
	calculatePercentage

else
   echo "Please enter the number greater then Zero"
fi



