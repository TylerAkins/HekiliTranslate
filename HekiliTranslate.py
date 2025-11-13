import keyboard
import datetime
import time
import json
from mss import mss

j = open('config.json')
data = json.load(j)

delay = data['settings']['delay']
debug = data['settings']['debug']
x = data['settings']['x']
y = data['settings']['y']

def region_matches_color(sct, x, y, expected_rgb, tolerance=2):
    # Define the rectangle to capture
    mon = {"top": y, "left": x, "width": 8, "height": 8}
    
    # Capture the region
    img = sct.grab(mon)
    width = img.width
    height = img.height

    for i in range(width):
        for j in range(height):
            pixel = img.pixel(i, j)
            for k, rgb in enumerate(expected_rgb):
                if abs(rgb - pixel[k]) > tolerance:
                    return False
    return True

sct = mss()

while True:
    for ability in data['abilities']:
        ts = datetime.datetime.now()
        rgb = tuple(ability['color'])
        
        if region_matches_color(sct, x, y, rgb):
            if debug:
                print(ts, ":Using ", ability['name'])
            keyboard.send(ability['keybind'])
            time.sleep(delay)
