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


class PowerNode:
    def __init__(self, name, ip_addr):
        self.name = name
        self.ip_addr = ip_addr

    # Get current on/off state of outlets
    def get_state(self):
        pass

    def turn_on(self, ):
        pass

    def turn_off(self):
        pass

    def all_on(self):
        pass

    def all_off(self):
        pass
