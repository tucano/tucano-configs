#!/bin/sh
#
# +-+-+-+-+-+-+-+
#  U P D A T E R
# +-+-+-+-+-+-+-+
#

function show_usage() {
	echo "Usage: $0 action [args ...]"
	echo "action help for actions list"
	exit 1	
}

if [ $# -lt 1 ]
then
	show_usage
fi


function parse_action {
	if [ "$1" == "help" ];then
		echo "HELP"
		
		index=1          # Reset count.
		                 # What happens if you forget to do this?
		
		if [ $# -gt 1 ];then
			shift
			for arg in "$@"; do
				echo "Arg #$index = $arg"
				let "index+=1"
			done
		fi
	elif [ "$1" == "update" ];then
		echo "UPDATE"
	elif [ "$1" == "install" ];then
		echo "INSTALL"
	elif [ "$1" == "create" ];then
		echo "INSTALL"
	else 
		show_usage
	fi
}


parse_action "$@"