#!/bin/bash
#
##############################################################################
#
#  Program :	Upd_Repo v1
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

repoargs=("-n -R stormos-manjaro.db.tar.gz *.pkg.tar.zst")

rm -f stormos-manjaro.*

banner "Update storm OS manjaro Repo..."

repo-add $repoargs
#sleep 8
cp stormos-manjaro.db.tar.gz stormos-manjaro.db

banner "Storm OS manjaro Repo Updated..."
