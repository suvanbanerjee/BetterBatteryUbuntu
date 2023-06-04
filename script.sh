#!/bin/bash
if [ "$EUID" -ne 0 ]
	then
	echo "Run this script as root! (sudo ./script.sh)"
	exit
else
	echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
    		echo "Firstly we will install a tool called TLP"
			sleep 2
			sudo apt update -q
			sudo apt install tlp tlp-rdw git -y -q
			if sudo tlp start; then
				echo "Done"
				echo "Now we will install a tool called auto-cpufreq"
				git clone https://github.com/AdnanHodzic/auto-cpufreq.git
				cd auto-cpufreq && sudo ./auto-cpufreq-installer
				sudo auto-cpufreq --install
				cd ..
				rm -r auto-cpufreq
				echo "All Done Now Exit ^_^"
				exit
			else
				echo "someting went wrong"
				exit
			fi
		else
    		echo "Connect to Internet"
    		exit
		fi
fi