#!/bin/sh -e

blue='\033[0;34m'
green='\033[0;32m'
reset='\033[0m'

# Check if Ruby is installed
ruby=$(which ruby 2>/dev/null | grep -v "not found" | wc -l)


if [ !$ruby -eq 0 ] ; then
	printf "${blue}Do you want to install Ruby? [yes/no]${reset}\n"
	read answer

	if [ $answer = yes ] ; then
		printf "${green}============================== Installing Ruby ==============================${reset}\n"
	fi
fi

if [ $ruby -eq 0 ] ; then
	# Check if sass is installed
	sass=$(gem list sass -i)

	if [ !$sass ] ; then
		printf "${blue}Do you want to install sass? [yes/no]${reset}\n"
		read answer

		if [ $answer = yes ] ; then
			printf "${green}============================== Installing SASS ==============================${reset}\n"
			sudo su -c "gem install sass"
		fi
	fi


	# Check if compass is installed
	compass=$(gem list compass -i)

	if [ !$compass ] ; then
		printf "${blue}Do you want to install compass? [yes/no]${reset}\n"
		read answer

		if [ $answer = yes ] ; then
			printf "${green}============================== Installing Compass ==============================${reset}\n"
			sudo su -c "gem install compass"
		fi
	fi
fi


exit