import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime
from collections import namedtuple

NodeData = namedtuple("NodeData", "light temperature humidity")

class SensorNode:
    def __init__(self, name, ip_addr, trig_time=None, trig_level=None):
        self.name = name
        self.ip_addr = ip_addr
        self.trig_time = trig_time
        self.trig_level = trig_level
        self.data = NodeData("1", "2", "3")
        self.power_node = None

    def get_data(self):
        try:
            data = requests.get(self.ip_addr)

            if(data.status_code == 200):
                soup = BeautifulSoup(data.text, 'html.parser')
                table = soup.find("table", class_="sensor_values")
                headers = [header.text for header in table.findAll("th")]
                values = [{headers[i]: cell.text for i, cell in enumerate(row.find_all('td'))}
                            for row in table.find_all('tr')]

                vals = list(values[1].values()) #  First row in list is empty so only return second
                self.data = NodeData(vals[0], vals[1], vals[2])

        except requests.exceptions.RequestException as e:
            print(e)
            return False
    
    def update_power_node(self):
        if self.power_node is None:
            return


class PowerNode:
    def __init__(self, name, ip_addr):
        self.name = name
        self.ip_addr = ip_addr
        self.relay_states = list([0, 0, 0, 0])

    # Get current on/off state of outlets
    def get_state(self):
        try:
            data = requests.get(f"{self.ip_addr}/relay_states")

            if(data.status_code == 200):
                soup = BeautifulSoup(data.text, 'html.parser')
                table = soup.find("table", class_="relay_states")
                headers = [header.text for header in table.findAll("th")]
                values = [{headers[i]: cell.text for i, cell in enumerate(row.find_all('td'))}
                            for row in table.find_all('tr')]

                self.relay_states = list(values[1].values()) #  First row in list is empty so only return second

        except requests.exceptions.RequestException as e:
            print(e)
            return False

    def turn_on(self, relay_num):
        try:
            data = requests.get(f"{self.ip_addr}/relay_{relay_num}_on")

            if(data.status_code == 200):
                self.get_state()

        except requests.exceptions.RequestException as e:
            print(e)

    def turn_off(self, relay_num):
        try:
            data = requests.get(f"{self.ip_addr}/relay_{relay_num}_off")

            if(data.status_code == 200):
                self.get_state()

        except requests.exceptions.RequestException as e:
            print(e)

    def all_on(self):
        for i in range(4):
            self.turn_on(i+1)

    def all_off(self):
        for i in range(4):
            self.turn_off(i+1)
