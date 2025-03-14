#!/bin/bash/

file_name="file.txt"

if [ -f "$file_name" ]; then
	echo "The file '$file_name' exists in the current directory."
else
	echo "The file '$file_name' does not exists in the current directory."
fi
