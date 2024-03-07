#!/bin/bash

# Check if at least 2 arguments are given (# of arguments is less than 2)
if [ $# -lt 2 ]; then
    echo "Usage: $0 <interval in seconds> <command>"
    exit 1
fi

# Read interval and command from arguments
INTERVAL=$1
shift  # Shift arguments to left ($2 becomes $1, etc.)
COMMAND="$@"

# Main loop
while true; do
    clear
    echo "Every $INTERVAL seconds: $COMMAND"
    date
    echo
    eval $COMMAND
    sleep $INTERVAL
done

