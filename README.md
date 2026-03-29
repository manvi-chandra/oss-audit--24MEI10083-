# oss-audit--24MEI10083-
Student Name- Manvi Chandra
Roll no.- 24MEI10083
Chosen software- vlc media player

# Script 1: System Identity Report
Purpose: Generates a professional "Welcome Screen" or "Audit ID" for the system. It captures live kernel data, uptime, and user information to identify the environment and its open-source licensing (GPL).
How to Run
Create the file: nano welcome.sh
Make it executable: chmod +x welcome.sh
Execute: ./welcome.sh

*Key Concepts*

Command Substitution ($(...))
Environment Variables ($HOME, $USER)
Output Formatting (echo)

# Script 2: FOSS Package Inspector
Purpose: A diagnostic tool that detects if a specific software (like VLC or Nmap) is installed. It uses a case statement to provide a philosophical context for the software's role in the FOSS ecosystem.
How to Run
Create the file: nano foss_inspector.sh
Make it executable: chmod +x foss_inspector.sh
Execute: ./foss_inspector.sh
Input: Type the name of a package (e.g., vlc) when prompted.

*Key Concepts*

if-then-else conditionals
case statements for multiple options
Pipe usage (|) with grep and awk

# Script 3: Disk and Permission Auditor

Purpose: Loops through critical system directories (and VLC config paths) to report ownership, permissions, and disk usage. This is essential for verifying security settings and storage health.
How to Run
Create the file: nano check_sys_dirs.sh
Make it executable: chmod +x check_sys_dirs.sh
Execute with Sudo: sudo ./check_sys_dirs.sh

*Key Concepts*

for loops through arrays
Text extraction using awk (fields $1, $3, $4)
Human-readable disk usage (du -sh)

# Script 4: Log Analyzer (Keyword Counter)

Purpose: Scans a provided log file for a specific keyword (default: "ERROR"). It includes a "retry" mechanism that waits if the file is empty and uses a loop to process large files line-by-line efficiently.
How to Run
Create the file: nano log_analyzer.sh
Make it executable: chmod +x log_analyzer.sh
Execute with an argument: ./log_analyzer.sh /var/log/dpkg.log

*Key Concepts*

Positional Parameters ($1)
while-read loops for line processing
File size testing ([ -s "$FILE" ])

# Script 5: Open Source Manifesto Generator

Purpose: An interactive tool that asks the user questions about their open-source philosophy and generates a personalized .txt manifesto file.
How to Run
Create the file: nano manifesto_generator.sh
Make it executable: chmod +x manifesto_generator.sh
Execute: ./manifesto_generator.sh
Review result: Check the output file: cat manifesto_$(whoami).txt

*Key Concepts*

Interactive input (read -p)
String concatenation
File redirection (>) and command results in filenames

🛠 Troubleshooting
Permission Denied: Always ensure you have run chmod +x <filename> before trying to run a script.

Empty Reports: If Script 3 or 4 shows "0" or "Permission Denied," re-run them using sudo.

Case Sensitivity: Remember that Linux paths and keywords are case-sensitive (e.g., vlc is different from VLC).
