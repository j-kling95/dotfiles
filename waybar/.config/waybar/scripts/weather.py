import requests
import sys
import json

def main():
    url = "https://api.open-meteo.com/v1/forecast?latitude=50.7726&longitude=7.0439&current=temperature_2m,is_day,rain,showers,snowfall,precipitation,cloud_cover,weather_code&timezone=Europe%2FBerlin"

    data = requests.get(url)

    o = data.json()

    temperature = (str(int(o["current"]["temperature_2m"])))

    waybarjson = f'{{"text": "{temperature}", "alt": "test", "tooltip": "test", "class": "$class", "percentage": 20 }}'

    print(waybarjson)
    
    return waybarjson

main()
