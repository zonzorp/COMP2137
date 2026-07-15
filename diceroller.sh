#!/bin/bash

######
# Definitions and variables
######
sides=6
numdice=2

#####
# Standard funcs and vars
#####
source mylibrary.sh

#####
# Functions
#####
function displayhelp (
	cat <<EOF
Usage: $progname [-v|--verbose] [-h|--help] [-s N]

  This command rolls dice. The user can change some defaults.
  The default number of sides is 6 and the default number of dice is 2.
  -s N changes the default of 6 sides per die to a number N, where N is between 2 and 20 inclusive
  
EOF
)

######
# Process the command line
######
while [ $# -gt 0 ]; do
# process $1
	case "$1" in
		-v | --verbose )
			verbose=yes
			;;
		-h | --help )
			displayhelp
			exit
			;;
		-s )
			shift
			sides=$1
			if [ -n "$sides" ]; then
				if [ $sides -lt 2 -o $sides -gt 20 ]; then
					errormessage "$USER gave an invalid number of die sides - '$1'"
					displayhelp
					exit 1
				fi
			else
				errormessage "$USER gave unknown command line data '$1'"
				displayhelp
				exit 1
			fi
			;;
		* )
			displayhelp
			fatalerrorexit "$USER does not seem to know that the die sides option requires a number"
			;;
	esac
# get rid of $1 and move all the other variables down one
	shift
done

######
# Main
######
if [ "$verbose" = "yes" ]; then
	echo "The command given was $0"
	echo "The command name was $progname"
fi
logmessage "Started"


total=0
[ "$verbose" = "yes" ] && printf "Rolling... "
for (( numrolled=0; numrolled < $numdice ; numrolled++ )); do
	roll=$(( RANDOM % sides + 1 ))
	[ "$verbose" = "yes" ] && printf "$roll "
	total=$(( roll + total ))
done
printf "\n Rolled a $total\n"


logmessage "Ended"


