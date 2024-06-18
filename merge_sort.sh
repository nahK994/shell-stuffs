#!/bin/bash

merge() {
    local -n arr=$1
    local -n arr2=$2
    i=0
    j=0
    local merged_arr=()
    local arr_length=${#arr[@]}
    local arr2_length=${#arr2[@]}

    while [ $i -lt $arr_length ] && [ $j -lt $arr2_length ]; do
        if [ ${arr[i]} -lt ${arr2[j]} ]; then
            merged_arr+=(${arr[i]})
            ((i++))
        else
            merged_arr+=(${arr2[j]})
            ((j++))
        fi
    done
    while [ $j -lt $arr2_length ]; do
        merged_arr+=(${arr2[j]})
        ((j++))
    done
    while [ $i -lt $arr_length ]; do
        merged_arr+=(${arr[i]})
        ((i++))
    done
    
    echo "${merged_arr[@]}"
}

sort() {
    declare -a arr=$1
    if [ ${#arr[@]} -eq 1 ]; then
        echo "AHHAHAHAHAHAH -> ${arr[@]} (${#arr[@]}) <- AHAHHAHAHAHAHAH"
        echo "${arr[@]}"
        return
    fi
    
    local mid_index
    ((mid_index=${#arr[@]}/2))
    local arr2=${arr[@]:0:mid_index}
    
    # local arr_length=${#arr[@]}
    # local ln=$((arr_length-mid_index))
    local arr3=${arr[@]:mid_index}
    
    arr2=($(sort arr2))
    arr3=($(sort arr3))

    echo "arr2 = ${arr2[@]} \n"
    echo "arr3 = ${arr3[@]} \n"
    ans=($(merge arr2 arr3))
    echo "ans = ${ans[@]} \n"
    echo "${ans[@]}" 
}


# arr1=(10)
# arr2=(8 13)
# arr3=($(merge arr1 arr2))
# echo "${arr3[@]}"
# echo "${arr3[@]}"
arr=(5 4 3 2 1)
sorted_arr=($(sort ${arr[@]}))
echo "${sorted_arr[@]}"