import requests
import pyodbc
import time
import random
import uuid

API_KEY = "374f2baafcf7b416c3a1e9b52f58b135"

cities = [
    "Mumbai", "Delhi", "Chennai", "Bangalore",
    "Hyderabad", "Kolkata", "Pune", "Ahmedabad",
    "Jaipur", "Lucknow"
]

city_distances = {
    ("Mumbai", "Pune"): 150,
    ("Mumbai", "Delhi"): 1400,
    ("Mumbai", "Bangalore"): 980,
    ("Delhi", "Jaipur"): 280,
    ("Delhi", "Lucknow"): 550,
    ("Chennai", "Bangalore"): 350,
    ("Hyderabad", "Bangalore"): 570,
    ("Kolkata", "Delhi"): 1500,
    ("Ahmedabad", "Mumbai"): 530,
    ("Pune", "Hyderabad"): 560,
    ("Bangalore", "Chennai"): 350,
    ("Lucknow", "Delhi"): 550
}

conn = pyodbc.connect(
    "DRIVER={SQL Server};"
    "SERVER=DESKTOP-NUMT0Q5;"
    "DATABASE=LiveDataProject;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()

print("🚀 Live Supply Chain System Started...\n")

# 🔁 Infinite loop (real-time)
while True:
    for city in cities:
        try:
            # 🌦️ API Call
            url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric"
            data = requests.get(url).json()

            temp = data['main']['temp']
            weather = data['weather'][0]['main']

            # 🚚 Shipment status logic
            if weather in ["Rain", "Thunderstorm"]:
                status = "Delayed"
            elif weather == "Clear":
                status = "On Time"
            else:
                status = "In Transit"

             # 📦 Shipment simulation
            shipment_id = str(uuid.uuid4())[:8]

            origin = random.choice(cities)
            destination = random.choice([c for c in cities if c != origin])

            # 📏 Distance logic
            key = (origin, destination)
            reverse_key = (destination, origin)

            if key in city_distances:
                distance = city_distances[key]
            elif reverse_key in city_distances:
                distance = city_distances[reverse_key]
            else:
                distance = random.randint(200, 1500)

            # 🚛 Speed & time
            speed = random.randint(40, 60)  # km/hr realistic

            estimated_time = round(distance / speed, 1)

            # ⏱️ Delay logic
            if status == "Delayed":
                delay = random.uniform(2, 8)
            else:
                delay = random.uniform(0, 2)

            actual_time = round(estimated_time + delay, 1)

            # 💾 Insert
            cursor.execute("""
            INSERT INTO ShipmentLive 
            (city, temperature, weather_condition, shipment_status,
             shipment_id, origin_city, destination_city, distance_km,
             estimated_delivery_time, actual_delivery_time)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """,
            city, temp, weather, status,
            shipment_id, origin, destination, distance,
            estimated_time, actual_time)

            print(f"{city} | {weather} | {status} | {origin} → {destination} | {distance} km")

        except Exception as e:
            print("❌ Error:", e)

    conn.commit()

    print("\n⏳ Waiting for next update...\n")

    time.sleep(1800)

    