#!/bin/zsh
# build or update the website
# pass 'build' or 'update' as first argument
# 'update' is default

# we set the locale to POSIX for the rest of the process, so that the
# format of the date will be uniform for all contributors, with name
# of days in English.

# Set the operation to 'update' if not provided as the first argument
op=${1:='update'}

# Set the path to the directory containing the TeXmacs executable
tm_path=/Applications/TeXmacs.app/Contents/MacOS

# Construct the Scheme command to be executed by TeXmacs
cmd='(begin (display* "$LC_ALL :" (getenv "LC_ALL") "\n" "$PWD    :" (getenv "PWD") "\n") \
            (load (url->unix "$PWD/notes-tools.scm")) \
            (notes-'$op') \
            (quit))'

# Print the operation that will be performed
echo "I'm going to perform: $op"

# Set environment variables and execute the TeXmacs command
LC_ALL=POSIX TEXMACS_PATH=$tm_path $tm_path/texmacs -x "$cmd"
