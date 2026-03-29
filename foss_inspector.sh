#!/bin/bash
# Script 2: FOSS Package Inspector
# Purpose: Check for installed software and display its Open Source "Philosophy"
# Ask user for package name
read -p "Enter package name to inspect: " PACKAGE
PACKAGE=$(echo "$PACKAGE" | tr '[:upper:]' '[:lower:]')
echo "------------------------------------------------"
echo "Searching for FOSS Package: $PACKAGE"
echo "------------------------------------------------"
# --- 1. Check if package is installed ---
# Detect package manager (dpkg for Debian/Kali, rpm for Fedora/RHEL)
if command -v dpkg &>/dev/null; then
    if dpkg -l | grep -q "^ii  $PACKAGE"; then
        echo "[STATUS]: $PACKAGE is installed."
        dpkg -l | grep "^ii  $PACKAGE" | awk '{print "Version: "$3}'
        dpkg -s $PACKAGE | grep -E 'Package:|Version:|Maintainer:|Description:'
    else
        echo "[STATUS]: $PACKAGE is NOT installed."
        echo "Tip: Install it using 'sudo apt install $PACKAGE'"
    fi
elif command -v rpm &>/dev/null; then
    if rpm -q $PACKAGE &>/dev/null; then
        echo "[STATUS]: $PACKAGE is installed."
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        echo "[STATUS]: $PACKAGE is NOT installed."
        echo "Tip: Install it using 'sudo dnf install $PACKAGE'"
    fi
else
    echo "No supported package manager found (dpkg or rpm)."
fi
echo "------------------------------------------------"
# --- 2. Case Statement: The Software Philosophy ---
case $PACKAGE in
    httpd|apache2)
        echo "Philosophy: Apache — the web server that built the open internet." ;;
    mysql|mariadb)
        echo "Philosophy: MySQL/MariaDB — open source data at the heart of millions of apps." ;;
    nmap)
        echo "Philosophy: Nmap — the eyes of the network; vital for open-source security." ;;
    wireshark)
        echo "Philosophy: Wireshark — transparency at the packet level; seeing the truth of the wire." ;;
    firefox)
        echo "Philosophy: Firefox — fighting for a private, open, and accessible web for all." ;;
    vlc)
        echo "Philosophy: VLC — freedom to play any media, anywhere." ;;
    *)
        echo "Philosophy: A unique piece of the vast Open Source ecosystem." ;;
esac
echo "------------------------------------------------"
