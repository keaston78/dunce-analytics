#!/usr/bin/env bash
# File: guessinggame.sh

state=0
end_game=0

file_count=$(ls -l | grep -v ^l | wc -l)

let file_count=$file_count-1


function test_state {

	if [[ end_game -eq 1 ]]
	then
		let state=$state+1
	fi
}

	while [[ $state -eq 0 ]]
	do

		echo "Guess how many files are in this directory (integers only please) and then press Enter:"
		read response

			if [[ response -lt $file_count ]] 
			then
				echo "Sorry, $response is too low. Try again"
				test_state
			fi

			if [[ response -gt $file_count ]]
			then
				echo "Sorry, $response is too high. Try again"
				test_state
			fi

			if [[ response -eq $file_count ]]
			then
				echo "You nailed it! Gratz!"
				let end_game=$end_game+1
				test_state
			fi

	done

