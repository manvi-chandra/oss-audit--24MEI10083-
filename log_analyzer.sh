#!/bin/bash
# Check if a filename was provided as the first argument ($1)
if [ -z "$1" ]; then
    echo "Usage: $0 <log_filename>"
    exit 1 
fi
LOGFILE=$1   
KEYWORD="ERROR" # You can change this or make it $2
ERROR_COUNT=0
# --- 1. Do-While Style Retry (if file is empty) ---
# This loop repeats as long as the file exists but has a size of 0 bytes
while [ -f "$LOGFILE" ] && [ ! -s "$LOGFILE" ]; do
    echo "File is empty. Waiting 5 seconds for data..."
    sleep 5
done

if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1 
fi
# --- 2. While-Read Loop to count matches ---
# We use 'done < "$LOGFILE"' to feed the file into the loop
while read -r line; do
    if [[ "$line" == *"$KEYWORD"* ]]; then
        ((ERROR_COUNT++))
    fi
done < "$LOGFILE"
# --- 3. Summary and Last 5 Matches ---
echo "-------------------------------------"
echo "Analysis Summary for: $LOGFILE"
echo "Total '$KEYWORD' entries found: $ERROR_COUNT"
echo "-------------------------------------"
if [ "$ERROR_COUNT" -gt 0 ]; then
    echo "Last 5 matching lines:"
    grep "$KEYWORD" "$LOGFILE" | tail -n 5
else
    echo "No matches found to display."
fi



