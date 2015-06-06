#!/bin/bash
 
echo "Welcome to CyberWings Team"
echo "Hay ,what u want to be"

if [ $(cat /etc/fedora-release | awk '{print $1}') = Fedora ]
then
	echo "Ur system is running $(cat /etc/redhat-release), $(uname -p)"
elif [ $(cat /etc/redhat-release | awk '{print $1}') = CentOS ]
then
	echo "Ur system is running  $(cat /etc/redhat-release) $(uname -p)"
elif [ $(cat /cat/redhat-release | awk '{print $1}') = "Red Hat" ]
then
	echo "Ur system is running  $(cat /etc/redhat-release) $(uname -p)"
else
	echo "error"
fi

if [ $(id -u) = 0 ]
then 
		echo "1. SElinux Check"
                echo "2. RAM Check"
                echo "3. Hard Disk Check"
                echo "4. Checking CPU info"
                echo "5. checking Apache"
                echo "0. exit"
		echo "help. Plz select one of the given to known"
	while true
	do
	read info 
		case $info in 
			1) echo "SElinux Checking"
				getenforce
				;;
			2) echo "RAM Check"
				free -m
				;;
			3) echo "Hard Disk Check"
				df 
				;;
			4) echo "Check CPU info"
				cat /proc/cpuinfo
				;;
			5) echo "checking Apache"
				if [ -f /etc/httpd/conf/httpd.conf ]
				then
				        echo "Apache Config file is here"
				else
				        echo "Apache Config file is not here"
					echo "Welcome to Cyberwings Server class"
					echo "which do you want to install?"
					echo "1. Apache"
					echo "2. Mysql"
					echo "3. PHP"
					echo "4.Clamav"
					echo "if u dont do insert Exit"
					read -p "Please if u want to install apache server , choose install and 2 to exit" install
					case $install in
						1) echo $webserver
							yum install httpd -y
								;;
						2) echo $Mysql
							yum install mariadb mariadb-server -y
								;;
						3) echo $PHP 
							yum install php php-mbstring php-mcrypt php-mysql php-pspell php-gd php-imap -y
								;;
						4) echo $Clamav 
							yum install clamav clamav-scanner clamav-update -y
								;;
						Exit) exit
								;;
						*) echo "error"
						esac 
				fi
								;;
			0) exit	
				;;
			help) echo "1: checking Selinux , forcing or disable"
				echo "2: checking RAM of the computer"
				echo "3: checking the free space of Hard-Disk"
				echo "4: checking the system of the CPU info"
				echo "5: checking the apache Configuration  file"
				;;
			*) echo "error"
		esac
	done 
else
	echo "error"
	echo "because u r not in root"
fi
