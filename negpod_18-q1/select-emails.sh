#!/usr/bin/env bash
#specify your input file
students_file="students-list_0923.txt"
#creating the file student-emails.txt
output_file="student-emails.txt"
#check if the file exists and is not empty.
if [ -e "$students_file" ] && [ -s "$students_file" ]; then
# Extract emails from students file and save them to student-emails.txt
cut -d ',' -f 1 "$students_file" > "$output_file"
else
    echo "Error: Input file does not exist or is empty."
fi
echo "Emails extracted and saved to $output_file."
