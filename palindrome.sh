#!/bin/bash

echo -e "Give me a string. I will tell you if it's a palindrome or not"
echo -n "Input: "
read input

is_palindrome=true
for (( i=0, j=${#input}-1 ; i<j ; i++, j-- ));
do
    if [[ ${input:i:1} != ${input:j:1} ]];
    then
        is_palindrome=false
        echo $input "isn't a palindrome"
        break
    fi
done

if [[ $is_palindrome == true ]]; then
    echo $input "is a palindrome"
fi
