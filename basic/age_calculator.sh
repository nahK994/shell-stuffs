#!/bin/bash

age_info_extractor() {
    local date_of_birth=$1
    local day=${date_of_birth:0:2}
    local month=${date_of_birth:3:2}
    local year=${date_of_birth:6:4}

    echo "$day $month $year"
}

calculator() {
    local info=($(age_info_extractor $1))
    local day=${info[0]}
    local month=${info[1]}
    local year=${info[2]}

    today=$(date +'%d/%m/%Y')
    local current_date_info=($(age_info_extractor $today))
    local current_day=${current_date_info[0]}
    local current_month=${current_date_info[1]}
    local current_year=${current_date_info[2]}
    
    age=$((current_year-year))
    
    if [[ $current_month -lt $month ]]; then
        ((age--))
    elif [[ $current_month -eq $month ]]; then
        if [[ $current_day -lt $day ]]; then
            (($age--))
        fi
    fi

    echo $age
}

echo -n "Tell us your date of birth(in dd/mm/yyyy format): "
read date_of_birth

age=$(calculator $date_of_birth)
echo $age