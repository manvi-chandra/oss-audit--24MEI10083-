                                                                                            manifesto_generator.sh                                                                                                        
#!/bin/bash
# Script: Open Source Manifesto Generator
echo "--------------------------------------------------"
echo "Answer three questions to generate your manifesto."
echo "--------------------------------------------------"
# 1. read for user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD
# Get the current date for the signature
DATE=$(date '+%d %B %Y')
OUTPUT="manifesto_$(whoami).txt"
# 2. String Concatenation & Paragraph Composing
# We use a heredoc or a long string to build the paragraph
CONTENT="OPEN SOURCE MANIFESTO
Created on: $DATE
--------------------------------------------------
I use $TOOL everyday.Since, the day i discovered $TOOL,I have felt immense '$FREEDOM' and streamed a ton of stuff. I wish to build $BUILD and share it freely just like $TOOL and let people feel the same surprise and happiness I felt. 
--------------------------------------------------"
# 3. Writing to a file with > (overwrite) or >> (append)
# We use > first to create/clear the file, then add the content
echo "$CONTENT" > "$OUTPUT"
echo ""
echo "Manifesto successfully saved to $OUTPUT"
echo "--------------------------------------------------"
# 4. Display the result
cat "$OUTPUT"
# --- ALIAS CONCEPT DEMONSTRATION ---
# To run this script by just typing 'manifesto' in your terminal,
# you would add this line to your ~/.bashrc file:
# alias manifesto='/home/$(whoami)/scripts/manifesto_generator.sh'


