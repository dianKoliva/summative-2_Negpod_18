#!/usr/bin/env bash
#moving file into another location
directory="negpod_7-q1"

if [ ! -d "$directory" ]; then
	mkdir "$directory"
fi

mv main.sh students-list_0923.txt select-emails.sh student-emails.txt "$directory"

echo "files moved successfully"
