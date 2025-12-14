#!/bin/bash

process_args(){

if [ "$#" -eq 0 ]; then
	echo "show help"
	return 0
else
	for ARG in "$@"; do
		case "$ARG" in
			"--help")
				echo "help";;
			"--cpu")
				cpu_check;;
			"--memory")
				echo "memory";;
			"--disk")
				echo "disk";;
			*)
				echo "Invalid argument: $ARG"
				return 1
		esac
	done
fi

}


cpu_check(){
 echo "CPU usage: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')"
}

process_args "$@"
