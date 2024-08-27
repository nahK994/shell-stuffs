#!/bin/bash

# Replace with your OpenWeatherMap API key
API_KEY="your_api_key_here"

# Prompt the user to enter the city name
read -p "Enter the city name: " CITY

# Fetch the weather information using the OpenWeatherMap API
response=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=23.9089&lon=89.1222&appid=b5dfb0a26f2993519124f908c052a423")

# Check if the response contains valid data
if echo "$response" | grep -q '"cod":"404"'; then
    echo "City not found!"
    exit 1
fi

# Extract relevant information from the JSON response
city_name=$(echo $response | jq -r '.name')
country=$(echo $response | jq -r '.sys.country')
weather_description=$(echo $response | jq -r '.weather[0].description')
temperature=$(echo $response | jq -r '.main.temp')
humidity=$(echo $response | jq -r '.main.humidity')
wind_speed=$(echo $response | jq -r '.wind.speed')

# Display the weather information
echo "Weather Information for $city_name, $country:"
echo "Description : $weather_description"
echo "Temperature : $temperature°C"
echo "Humidity    : $humidity%"
echo "Wind Speed  : $wind_speed m/s"
