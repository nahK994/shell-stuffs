#!/bin/bash

arr=(-4 -2 -1 0 1 3 5 9 12)
echo -n "Input: "
read number

start_index=0
(( end_index=${#arr[@]}-1 ))
(( mid=(start_index+end_index)/2 ))

while [ $start_index -le $end_index ];
do
    (( mid=(start_index+end_index)/2 ))
    if [[ arr[mid] -eq number ]]; then
        is_found=true
        break
    elif [[ arr[mid] -gt number ]]; then
        (( end_index=mid-1 ))
    else
        (( start_index=mid+1 ))
    fi
done

if [[ start_index -gt end_index ]]; then
    echo "Not found $number"
else
    echo "Found $number"
fi