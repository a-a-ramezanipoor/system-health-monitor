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
				echo "cpu";;
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

process_args "$@"
