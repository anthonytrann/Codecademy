class Menu:
  def __init__(self, name, items, start_time, end_time):
    self.name = name
    self.items = items
    self.start_time = start_time
    self.end_time = end_time

  def __repr__(self):
    return "The " + self.name + " menu is available from " + str(self.start_time) + " to " + str(self.end_time)

  def calculate_bill(self, purchased_items):
    total_bill = 0
    for item in purchased_items:
      total_bill += self.items[item]

    return total_bill

brunch_items = {
  'pancakes': 7.50, 
  'waffles': 9.40, 
  'burger': 11.00, 
  'home fries': 4.50, 
  'coffee': 1.50, 
  'espresso': 3.00, 
  'tea': 1.00, 
  'mimosa': 10.50, 
  'orange juice': 3.50,
}
brunch = Menu("brunch", brunch_items, 11, 16)

early_bird_items = {
  'salumeria plate': 8.00, 
  'salad and breadsticks (serves 2, no refills)': 14.00, 
  'pizza with quattro formaggi': 9.00, 
  'duck ragu': 17.50, 
  'mushroom ravioli (vegan)': 13.50, 
  'coffee': 1.50, 
  'espresso': 3.00,
  }

early_bird = Menu("early bird", early_bird_items, 15, 18)

dinner_items = {
  'crostini with eggplant caponata': 13.00,
  'caesar salad': 16.00, 
  'pizza with quattro formaggi': 11.00, 
  'duck ragu': 19.50, 
  'mushroom ravioli (vegan)': 13.50, 
  'coffee': 2.00, 
  'espresso': 3.00,
}

dinner = Menu("dinner", dinner_items, 17, 23)

kids_items = {
  'chicken nuggets': 6.50, 
  'fusilli with wild mushrooms': 12.00, 
  'apple juice': 3.00,
}

kids = Menu("kids", kids_items, 11, 21)

print(brunch.calculate_bill(['pancakes', 'home fries', 'coffee']))

print(early_bird.calculate_bill(['salumeria plate', 'mushroom ravioli (vegan)']))

class Franchise:
  def __init__(self, address, menus):
    self.address = address
    self.menus = menus

  def __repr__(self):
    return "The address is " + self.address

  def available_menus(self, time):
    available =[]
    for menu in self.menus:
      if time >= menu.start_time and time <= menu.end_time:
        available.append(menu)
    return available

flagship_store = Franchise("1232 West End Road", [brunch, early_bird, dinner, kids])

new_installment = Franchise("12 East Mulberry Street", [brunch, early_bird, dinner, kids])


print(flagship_store.available_menus(12))
print(new_installment.available_menus(17))


class Business:
  def __init__(self, name, franchises):
    self.name = name
    self.franchises = franchises

arepas_items = {
  'arepa pabellon': 7.00,
  'pernil arepa': 8.50,
  'guayanes arepa': 8.00,
  'jamon arepa': 7.50,
}
  
arepas_menu = Menu("Arepa", arepas_items, 10, 20)

arepa_place = Franchise("189 Fitzgerald Avenue", [arepas_menu])

business = Business("Basta Fazoolin' with my Heart", [flagship_store, new_installment])

business = Business("Take a' Arepa", [arepa_place])

