#!/bin/bash

# Get the network subnet (e.g., 192.168.1)
subnet=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | cut -d '/' -f 1 | cut -d '.' -f 1,2,3)

# Check if the subnet is empty
if [ -z "$subnet" ]; then
    echo "Could not determine the network subnet."
    exit 1
fi

echo "Scanning the network for active devices..."

# Loop through all possible IP addresses in the subnet
for ip in $(seq 1 254); do
    host="$subnet.$ip"
    echo $host
    # Ping the IP address and check if it's active
    ping -c 1 -W 1 $host > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        # If the host is active, resolve its hostname
        hostname=$(nslookup $host | awk -F': ' 'NR==5 {print $2}')
        
        # If the hostname is empty, print "Unknown"
        if [ -z "$hostname" ]; then
            hostname="Unknown"
        fi
        
        echo "Active device found: IP = $host, Hostname = $hostname"
    fi
done

echo "Network scan complete."
