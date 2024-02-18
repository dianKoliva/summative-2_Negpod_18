#!/usr/bin/env bash
#moving file into another location
directory="negpod_18-q1"

if [ ! -d "$directory" ]; then
	mkdir "$directory"
fi