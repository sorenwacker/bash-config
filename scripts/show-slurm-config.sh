#!/bin/bash

# Run sinfo and use awk to process and annotate the output
sinfo -o "%P %D %C" | awk 'BEGIN {
    print "Partition | Nodes | CPUs Allocated/Idle/Other/Total"
    print "----------|-------|---------------------------------"
} 
NR > 1 { # Skip the header line
    printf "%-10s | %5s | %s\n", $1, $2, $3
}' | column -t -s '|'
