import datetime as dt
from decimal import Decimal
from random import randint, choice
import custom_module

current_date = dt.date.today()
current_time = dt.datetime.now().time()

print(f"Today's date is {current_date} and the time is {current_time}")

base_cost = '1000.00'
base_cost_decimal = Decimal(base_cost)

target_year = dt.date(randint(1000,3000), 2, 5)
cost_multiplier = abs(current_date.year - target_year.year)

final_cost = round((base_cost_decimal + cost_multiplier), 2)

destinations = ['Spain', 'Moon', 'UK', 'Australia', 'Mars']
destination = choice(destinations)

print(custom_module.generate_time_travel_message(target_year, destination, final_cost))