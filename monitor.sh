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
				memory_check;;
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

memory_check(){
 echo "Memory usage: $(free -m | awk '/Mem:/ {printf("%.0f%%\n", $3/$2 * 100)}')"
}

process_args "$@"
