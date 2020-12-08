#!/bin/bash
#
##############################################################################
#
#  Program :	Git_Push v1
#  Arch    :	x86_64 
#  Author  : 	Ben
#  Website : 	https://sourceforge.net/projects/stormos/
#
##############################################################################

function banner() {
	term_cols=$(tput cols) 
	str=":: $1 ::"
	for ((i=1; i<=`tput cols`; i++)); do echo -n ‾; done
	tput setaf 10; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
	for ((i=1; i<=`tput cols`; i++)); do echo -n _; done
	printf "\n"
}

banner "Check for newer files online first..."
git pull
cd x86_64
sh upd_repo.sh
git add --all .

banner "Enter a commit comment (optional)"

read input

# Committing to the local repository
# with commit comment if given

banner "Committing to local repository..."
git commit -m "$input"

banner "Push local files to Github..."
git push -u origin master

banner "Git push completed..."
