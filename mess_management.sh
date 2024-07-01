#!/bin/bash

cost_per_person() {
    cost=$1
    echo $(echo "scale=3; $cost / $total_member" | bc)
}

get_meal_rate() {
    local total_meal=$((khan_meal+raj_meal+riaj_meal))
    local total_bazar=$((khan_bazar+raj_bazar+riaj_bazar))
    echo $(echo "scale=3; $total_bazar / $total_meal" | bc)
}

echo -n "Electricity bill = "
read electricity_bill
echo -e "\n"

echo -n "Khan's total meal = "
read khan_meal
echo -n "Khan's total bazar = "
read khan_bazar
echo -e "\n"

echo -n "Raj's total meal = "
read raj_meal
echo -n "Raj's total bazar = "
read raj_bazar
echo -e "\n"

echo -n "Riaj's total meal = "
read riaj_meal
echo -n "Riaj's total bazar = "
read riaj_bazar
echo -e "\n"

total_member=3

net_bill=1000
khala_bill=2100

khan_rent=5600
raj_rent=3025
riaz_rent=2875


echo -e "========= Per person utility cost ========="
echo -e "Electricity bill = " $(cost_per_person $electricity_bill)
echo -e "Khala bill = " $(cost_per_person $khala_bill)
echo -e "Internet bill = " $(cost_per_person $net_bill)
echo -e "--------------------"
echo -e "Total = " $(cost_per_person $((khala_bill+net_bill+electricity_bill)))
echo -e "========================================"

echo -e "\n"

echo -e "================== Meal =================="
echo -e "Total bazar = " $((khan_bazar+raj_bazar+riaj_bazar))
echo -e "Total meal = " $((khan_meal+raj_meal+riaj_meal))
echo -e "Meal RATE = " $(get_meal_rate)
echo -e "========================================"

# echo -e " ----- Khan ------\n"
# echo -e "------------------"
# echo -e "Rent =" $khan_rent

# echo -e "------------------"
# echo -e " ----- Raj ------"
# echo -e " ----- Vai ------"