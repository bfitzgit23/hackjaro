#!/bin/bash
#
##############################################################################
#
#  Program :	Clean_Up v1
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

banner "Cleaning up repo..."

mv .git/config config
rm -rf .git
sh ./git_setup*
mv config .git/config
git add --all .
git commit -m "New Release(s) Cleanup"
git push origin master --force

banner "Clean up completed..."
