#!/bin/bash -x

echo "/******************************************* WELCOME TO FLIP COIN SIMULATION *******************************************/"

# CONSTANTS
IS_HEAD=1
SINGLET=1
DOUBLET=2
TRIPLET=3

#VARIABLES
numberOfFlip=0

# DECLARING DICTIONARY
declare -A combination

# READING FLIPPING COUNT FROM USER
read -p "Enter a number of time you want to flip a coin : " numberOfCoinFlip

# CONDITION TO CHECK NUMBER OF FLIP IS NOT EQUAL TO ZERO
if [ $numberOfCoinFlip -ne 0 ]
then
echo "Please select your combination. "
echo "Select 1 for Singlet combination"
echo "Select 2 for Doublet combination"
echo "Select 3 for Triplet combination"
read choice

# TO GET RANDOM NUMBER
function getRandom(){
	randomCheck=$((RANDOM%2))
	echo $randomCheck
}

# FUNCTION TO CREATE A COMBINATION
	function getCombination(){
	local numberOfCoin=$1
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
			combination[$coinSide]=$((${combination[$coinSide]}+1))
		}
	}

# FUNCTION TO CALCULATE PERCENATGE OF COMBINATION
	function calculatePercentage(){
		for key in ${!combination[@]}
		do
			combination[$key]=`echo "scale=2; ${combination[$key]}*100/$numberOfCoinFlip" | bc`
		done
	}

# CASE STATEMENTS TO PERFORM USER CHOICE 
	case $choice in
		$SINGLET)
			getCombination $SINGLET
			calculatePercentage
					;;
		$DOUBLET)
			getCombination $DOUBLET
			calculatePercentage
					;;
		$TRIPLET)
			getCombination $TRIPLET
         calculatePercentage
					;;
		*)
			echo "Enter valid choice number"
					;;
	esac

# SORTING DICTIONARY AND DISPLAYING WINNING COMBINATION
	for index in ${!combination[@]}
	do
		echo "$index ${combination[$index]}"
	done |
	sort -k2 -rn | head -1
else
   echo "Please enter the number greater then Zero"
fi



