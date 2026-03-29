#!/bin/bash 
# Script 1: System Identity Report
# Author: [Your Name] | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="ManviChandra"
SOFTWARE_CHOICE="Vlc Media Player"

# --- System info ---
# uname -r gets the kernel version
KERNEL=$(uname -r)
# whoami gets the current user
USER_NAME=$(whoami)
# uptime -p shows how long the system has been running in "pretty" format
UPTIME=$(uptime -p)
# Extract the Pretty Name from the OS release file
DISTRO=$(grep "PRETTY_NAME" /etc/os-release | cut -d'"' -f2)
# Get current date and time
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')
# User's home directory is stored in the $HOME environment variable
HOME_DIR=$HOME

# --- Display ---
echo "================================================"
echo "  Open Source Audit — $STUDENT_NAME"
echo "================================================"
echo "Operating System : $DISTRO"
echo "Kernel Version   : $KERNEL"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME_DIR"
echo "System Uptime    : $UPTIME"
echo "Current Date/Time: $CURRENT_TIME"
echo "------------------------------------------------"
echo "License Note: This system ($SOFTWARE_CHOICE) is"
echo "primarily covered by the GNU General Public"
echo "License (GPL). Freedom to study and modify!"
echo "________________________________________________"

