weight = 8.4
print("The weight of the package is ", weight, "lb")
cost_ground = 0

# Ground shipping
if weight <= 2:
  cost_ground = weight * 1.5 + 20
elif weight > 2 and weight <= 6:
  cost_ground = weight * 3 + 20
elif weight > 6 and weight <= 10:
 cost_ground = weight * 4 + 20
else:
  cost_ground = weight * 4.75 + 20

# Test 8.4lb should give 53.60
print("Ground Shipping: $%.2f" % cost_ground)

cost_ground_premium = 125.00

print("Ground Shipping Premium: $%.2f" % cost_ground_premium)

# Drone Shipping
if weight <= 2:
  cost_ground = weight * 4.5
elif weight > 2 and weight <= 6:
  cost_ground = weight * 9
elif weight > 6 and weight <= 10:
 cost_ground = weight * 12
else:
  cost_ground = weight * 14.25

print("Drone Shipping: $%.2f" % cost_ground)

