#!/bin/bash

cost_per_person() {
    cost=$1
    echo $(echo "scale=3; $cost / $total_member" | bc)
}

echo -n "Electricity bill = "
read electricity_bill
echo -e "\n"

total_member=3

net_bill=1000
khala_bill=2100

khan_rent=5600
raj_rent=3025
vai_rent=2875


echo -e "==== Per person utility cost ===="
echo -e "Electricity bill = " $(cost_per_person $electricity_bill)
echo -e "Khala bill = " $(cost_per_person $khala_bill)
echo -e "Internet bill = " $(cost_per_person $net_bill)
echo -e "--------------------"
echo -e "Total = " $(cost_per_person $((khala_bill+net_bill+electricity_bill)))
echo -e "===================="

# echo -e " ----- Khan ------\n"
# echo -e "------------------"
# echo -e "Rent =" $khan_rent

# echo -e "------------------"
# echo -e " ----- Raj ------"
# echo -e " ----- Vai ------"