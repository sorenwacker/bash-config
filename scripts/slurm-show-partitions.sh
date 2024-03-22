#!/bin/bash

# Header
printf "%-12s | %-5s | %-30s | %-10s | %-11s | %s\n" "Partition" "Nodes" "CPUs (Alloc/Idle/Other/Total)" "MaxTime" "Memory (GB)" "GPUs"
LINE="-------------------------------------------------------------------------------------------"

echo $LINE
# Get all partitions
partitions=$(sinfo -h -o "%R")

for partition in $partitions; do
    # Get node and CPU information
    node_cpu_info=$(sinfo -h -p $partition -o "%D %C")
    
    # Get partition details including MaxTime, MaxNodes, and Memory
    partition_details=$(scontrol show partition $partition)
    max_time=$(echo "$partition_details" | grep "MaxTime" | sed 's/.*MaxTime=\([^ ]*\).*/\1/')
    max_nodes=$(echo "$partition_details" | grep "MaxNodes" | sed 's/.*MaxNodes=\([^ ]*\).*/\1/')
    mem=$(echo "$partition_details" | grep "MaxMemPerNode" | sed 's/.*MaxMemPerNode=\([^ ]*\).*/\1/')
    mem_gb=$((mem/1024)) # Assuming MaxMemPerNode is in MB
    
    # Adjust for partitions where memory might not be explicitly set
    if [ "$mem" == "4294967294" ] || [ "$mem" == "0" ]; then
        mem_gb="N/A"
    else
        mem_gb="${mem_gb}"
    fi

    # GPU information placeholder
    gpus="N/A GPUs"
    
    # Nodes and CPU info parsing for alignment
    IFS=' ' read -r -a node_cpu_array <<< "$node_cpu_info"
    nodes=${node_cpu_array[0]}
    cpus="${node_cpu_array[1]}/${node_cpu_array[2]}/${node_cpu_array[3]}/${node_cpu_array[4]}"
    
    # Use printf for formatted output
    printf "%-12s | %-5s | %-30s | %-10s | %-11s | %s\n" $partition $nodes "$cpus" "$max_time" "$mem_gb" "$gpus"
done
echo $LINE
echo ''
