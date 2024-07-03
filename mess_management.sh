#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

cost_per_person() {
    cost=$1
    echo $(echo "scale=3; $cost / $total_member" | bc)
}

get_meal_rate() {
    local total_meal=$((khan_meal+raj_meal+riaj_meal))
    local total_bazar=$((khan_bazar+raj_bazar+riaj_bazar))
    echo $(echo "scale=3; $total_bazar / $total_meal" | bc)
}

print_cost() {
    local name=$1
    local rent=$2
    local meal=$3
    local bazar=$4

    echo -e "\n\n${YELLOW}=================${NC} ${GREEN} ${name} ${NC} ${YELLOW}=================${NC}"
    echo -e "Rent =" $rent
    echo -e "Bazar =" $bazar
    echo -e "Meal =" $meal
    meal_cost=$(echo "scale=3; $meal * $meal_rate" | bc)
    echo -e "Meal cost (Meal x Meal_RATE) =" $meal_cost
    meal_balance=$(echo "scale=3; $meal_cost - $bazar" | bc)
    echo -e "Meal balance (Meal cost - Bazar) =" $meal_balance
    echo -e "------------------------------------------"
    echo -e "TOTAL (Rent + Meal + Bazar + Meal balance + Utility cost) =${RED}" $(echo "scale=3; $meal_balance+$rent+$per_person_utility_cost" | bc) "${NC}"
    echo -e "${YELLOW}============================================${NC}"
}

echo -n "Electricity bill = "
read electricity_bill

echo -n "Gas bill = "
read gas_bill

echo -n "Others bill = "
read others_bill
echo -e "\n"

total_member=3
khan_rent=5600
raj_rent=3025
riaj_rent=2875

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


net_bill=1000
khala_bill=$((700*total_member))


echo -e "=========  Utility cost (Per person)  ========="
echo -e "Electricity bill =" $(cost_per_person $electricity_bill)
echo -e "Gas bill =" $(cost_per_person $gas_bill)
echo -e "Khala bill =" $(cost_per_person $khala_bill)
echo -e "Internet bill =" $(cost_per_person $net_bill)
echo -e "Others cost =" $(cost_per_person $others_bill)
echo -e "------------------------------------------"
per_person_utility_cost=$(cost_per_person $((khala_bill+net_bill+electricity_bill+gas_bill+others_bill)))
echo -e "TOTAL =" $per_person_utility_cost
echo -e "============================================"

echo -e "\n"

echo -e "==================  Meal  =================="
echo -e "Total bazar =" $((khan_bazar+raj_bazar+riaj_bazar))
echo -e "Total meal =" $((khan_meal+raj_meal+riaj_meal))
meal_rate=$(get_meal_rate)
echo -e "------------------------------------------"
echo -e "Meal RATE =" $(get_meal_rate)
echo -e "============================================"

print_cost "Khan" ${khan_rent} ${khan_meal} ${khan_bazar}
print_cost "Raj" ${raj_rent} ${raj_meal} ${raj_bazar}
print_cost "Riaj" ${riaj_rent} ${riaj_meal} ${riaj_bazar}