#!/bin/bash
#
##############################################################################
#
#  Program :	Git_Setup v1
#  Arch    :	x86_64 
#  Author  : 	Ben
#  Website : 	https://sourceforge.net/projects/stormos/
#
##############################################################################

# Thanks to Eric Dubois (http://www.erikdubois.be)
# Problem solving commands

# Read before using it.
# https://www.atlassian.com/git/tutorials/undoing-changes/git-reset
# git reset --hard orgin/master
# ONLY if you are very sure and no coworkers are on your github.

# Commands that have helped in the past
# Force git to overwrite local files on pull - no merge
# git fetch all
# git push --set-upstream origin master
# git reset --hard orgin/master

function banner() {
	term_cols=$(tput cols) 
	str=":: $1 ::"
	for ((i=1; i<=`tput cols`; i++)); do echo -n ‾; done
	tput setaf 10; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
	for ((i=1; i<=`tput cols`; i++)); do echo -n _; done
	printf "\n"
}

# Installing git if not installed for Arch Linux

if ! location="$(type -p "git")" || [ -z "git" ]; then
	banner "Installing git..."
	# check if pacman is installed
	if which pacman > /dev/null; then
		sudo pacman -S --noconfirm git
	fi
fi

# Setting up a Git Repository
# https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config

banner "Setting up Git..."

git init
git config --global user.name "bfitzgit23"
git config --global user.email "dfitz@me.com"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

banner "Git Setup Completed..."
