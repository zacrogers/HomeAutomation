import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime

def get_sensor_data(ip_addr):
    try:
        data = requests.get(ip_addr)

        if(data.status_code == 200):
            soup = BeautifulSoup(data.text, 'html.parser')
            table = soup.find("table", class_="sensor_values")
            headers = [header.text for header in table.findAll("th")]
            values = [{headers[i]: cell.text for i, cell in enumerate(row.find_all('td'))}
                        for row in table.find_all('tr')]

            return values[1] # First row in list is empty so only return second

    except requests.exceptions.RequestException as e:
        print(e)

sensor_vals = get_sensor_data("http://192.168.1.92/sensors")
vals_list = list(sensor_vals.values())

now = datetime.now()
current_time = now.strftime("%H:%M:%S")

vals_list.append(current_time)

with open('sensor_vals.csv', 'a') as f:
    writer = csv.writer(f)
    writer.writerow(vals_list)
    # f.write(list(sensor_vals.values()))