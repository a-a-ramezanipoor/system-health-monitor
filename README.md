# System Monitor Script (monitor.sh)

A lightweight and easy-to-use **Bash script** for monitoring your system's CPU, memory, and disk usage. This script is ideal for sysadmins, DevOps engineers, and developers who want quick insights into system performance directly from the terminal.

---

## Features

- ✅ Display **CPU usage** in real-time
- ✅ Display **memory usage** as a percentage
- ✅ Display **disk usage** of the root directory
- ✅ Easy-to-read output suitable for quick diagnostics
- ✅ Simple **command-line interface** with helpful options

---

## Prerequisites

- Linux-based system (tested on Ubuntu)
- Bash shell
- `awk`, `grep`, `top`, `free`, and `df` commands available (usually pre-installed on most Linux distributions)

---

## Usage

Clone or download the script, give it executable permissions, and run with desired options:

```bash
chmod +x monitor.sh
./monitor.sh [OPTIONS]

Options
Option	Description
--help	Show this help message
--cpu	Display current CPU usage
--memory	Display current memory usage
--disk	Display disk usage of /
Examples

# Show CPU usage
./monitor.sh --cpu

# Show memory usage
./monitor.sh --memory

# Show disk usage
./monitor.sh --disk

# Show all metrics
./monitor.sh --cpu --memory --disk

# Show help
./monitor.sh --help

---

## How It Works

The script uses standard Linux commands:

- **CPU usage:** `top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
- **Memory usage:** `free -m | awk '/Mem:/ {printf("%.0f%%\n", $3/$2 * 100)}'`
- **Disk usage:** `df -h / | awk 'NR==2 {print $5}'`

Arguments are processed via the `process_args` function, allowing flexible and intuitive command-line interaction.

---

## Why Use This Script?

- Lightweight alternative to full monitoring tools
- No dependencies beyond standard Linux utilities
- Perfect for learning **Bash scripting** and **system monitoring basics**
- Resume-worthy: demonstrates **command-line scripting, system metrics analysis, and automation skills**

---

## Author

**Your Name**  
Email: a.a.ramezanipoor@gmail.com
GitHub: github.com/a-a-ramezanipoor

---

## License

MIT License

