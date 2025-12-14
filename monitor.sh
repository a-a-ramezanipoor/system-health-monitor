#!/bin/bash

process_args(){

if [ "$#" -eq 0 ]; then
	echo "show help"
	return 0
else
	for ARG in "$@"; do
		case "$ARG" in
			"--help")
				show_help;;
			"--cpu")
				cpu_check;;
			"--memory")
				memory_check;;
			"--disk")
				disk_check;;
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

disk_check(){
 echo "Disk usage: $(df -h / | awk 'NR==2 {print $5}')"
}

show_help() {
    echo "Usage: ./monitor.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --help       Show this help message"
    echo "  --cpu        Show CPU usage"
    echo "  --memory     Show memory usage"
    echo "  --disk       Show disk usage"
}




process_args "$@"
