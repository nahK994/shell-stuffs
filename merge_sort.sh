#!/bin/bash

merge() {
    local -n arr=$1
    local -n arr2=$2

    i=0
    j=0
    local merged_arr=()
    arr_length=${#arr[@]}
    arr2_length=${#arr2[@]}

    if [ $arr_length -lt $arr2_length ];
    then
        while [ $i -lt $arr_length ] && [ $j -lt $arr2_length ];
        do
            if [ ${arr[i]} -lt ${arr2[j]} ];
            then
                merged_arr+=(${arr[i]})
                ((i++))
            else
                merged_arr+=(${arr2[j]})
                ((j++))
            fi
        done

        if [ $j -lt $arr2_length ];
        then
            while [ $j -lt $arr2_length ];
            do
                merged_arr+=(${arr2[j]})
                ((j++))
            done
        fi
        if [ $i -lt $arr_length ];
        then
            while [ $i -lt $arr_length ];
            do
                merged_arr+=(${arr[i]})
                ((i++))
            done
        fi
    else
        while [ $i -lt $arr2_length ] && [ $j -lt $arr_length ];
        do
            if [ ${arr2[i]} -lt ${arr[j]} ];
            then
                merged_arr+=(${arr2[i]})
                ((i++))
            else
                merged_arr+=(${arr[j]})
                ((j++))
            fi
        done

        if [ $j -lt $arr_length ];
        then
            while [ $j -lt $arr_length ];
            do
                merged_arr+=(${arr[j]})
                ((j++))
            done
        fi
        if [ $i -lt $arr2_length ];
        then
            while [ $i -lt $arr2_length ]:
            do
                merged_arr+=(${arr2[i]})
                ((i++))
            done
        fi
    fi

    echo "${merged_arr[@]}"
}

arr=(1 4 9)
arr2=(4 5 6)
arr3=($(merge arr arr2))
echo "${arr3[@]}"