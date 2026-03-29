#!/bin/bash
# Script 3: Disk and Permission Auditor
# Purpose: Loop through system folders to check size, ownership, and permissions.
# --- Configuration ---
DIRS=("/etc" "/var/log" "/usr/bin" "usr/share/vlc")
# vlc specific config directory
MY_SOFTWARE_CONFIG="$HOME/.config/vlc"
echo "----------------------------------------------------------------------"
echo "Directory Audit Report - Generated on $(date)"
echo "----------------------------------------------------------------------"
echo -e "DIRECTORY\tPERMISSIONS\tOWNER\tGROUP\tSIZE"
echo "----------------------------------------------------------------------"
# --- 1. The Main System Directory Loop ---
for DIR in "${DIRS[@]}"; do
    # Check if the directory actually exists
    if [ -d "$DIR" ]; then
        # Use ls -ld to get metadata, then use awk to grab:
        # $1 (Permissions), $3 (Owner), $4 (Group)
        PERMS_INFO=$(ls -ld "$DIR" | awk '{print $1 "\t" $3 "\t" $4}') 
        # Use du -sh for 'disk usage' in 'human-readable' format
        # Use cut -f1 to grab only the first field (the size)
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        # Print the formatted line (\t adds a tab for alignment)
        echo -e "$DIR\t$PERMS_INFO\t$SIZE"
    else
        # Handle cases where a directory might not exist
        echo -e "$DIR\t[!] Directory not found or inaccessible"
    fi
done
echo "----------------------------------------------------------------------"

# --- 2. TODO: vlc  Software Config Directory Check ---
echo "Checking vlc Software Config Status..."
if [ -d "$MY_SOFTWARE_CONFIG" ]; then
    # Grab just the permissions string for this specific check
    CONFIG_PERMS=$(ls -ld "$MY_SOFTWARE_CONFIG" | awk '{print $1}| Owner: "$3}')
    echo "[FOUND] vlc config:  $MY_SOFTWARE_CONFIG exists with permissions: $CONFIG_PERMS"
else
    echo "[MISSING] vlc Configuration directory $MY_SOFTWARE_CONFIG was not found."
fi
echo "----------------------------------------------------------------------"

