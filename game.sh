#!/bin/bash

welcome() {
    echo "Let's play a game. Input a number"
    echo "1) To get factorial of the number"
    echo "2) Print the table of the number"
    echo "3) To get summation of all numbers from 1 to the number"
    echo "4) To get summation of some comma separated numbers"
}

print_factorial() {
    echo -n "Number: "
    read number
    fac=1
    for ((i=1 ; i<=number ; i++ ))
    do
        fac=$((i*fac))
    done
    echo "Factorial of" $number "is" $fac
}

print_table() {
    echo -n "Number: "
    read number
    
    for i in {1..10}
    do
        echo $number "x" $i "=" $((number*i))
    done
}

print_series_summation() {
    echo -n "Number: "
    read number

    sum=0
    for (( i=1 ; i<=number ; i++ ))
    do
        sum=$((sum+i))
    done

    echo "Summation is:" $sum
}

print_list_summation() {
    echo -n "List: "
    read -a list

    sum=0
    for i in ${list[@]}
    do
        sum=$((sum+i))
    done

    echo "Summation is:" $sum
}


welcome
echo -n "Choose option: "
read option

if [ $option -eq 1 ]; then
    print_factorial
elif [ $option -eq 2 ]; then
    print_table
elif [ $option -eq 3 ]; then
    print_series_summation
elif [ $option -eq 4 ]; then
    print_list_summation
fi