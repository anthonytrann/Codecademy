class School():
  def __init__(self, name, level, numberOfStudents):
    self.name = name
    self.level = level
    self.numberOfStudents = numberOfStudents

  def __repr__(self):
    return f'A {self.level} school named {self.name} with {self.numberOfStudents} students.'

  def getName(self):
    return self.name

  def getLevel(self):
    return self.level

  def getNumberOfStudents(self):
    return self.numberOfStudents

  def setNumberOfStudents(self, num):
    self.numberOfStudents = num

  
a = School("Codecademy", "high", 100)
print(a)
print(a.getName())
print(a.getLevel())
a.setNumberOfStudents(200)
print(a.getNumberOfStudents())



class PrimarySchool(School):
  def __init__(self, name, numberOfStudents, pickupPolicy):
    super().__init__(name, "primary", numberOfStudents)
    self.pickupPolicy = pickupPolicy

  def __repr__(self):
    schoolRepr = super().__repr__()
    return schoolRepr + f" The pickup policy is {self.pickupPolicy}"

  def getPickupPolicy(self):
    return self.pickupPolicy

b = PrimarySchool("Codecademy", 300, "Pickup Allowed")
print(b.getPickupPolicy())
print(b)


class HighSchool(School):
  def __init__(self, name, numberOfStudents, sportsTeams):
    super().__init__(name, "high", numberOfStudents)
    self.sportsTeams = sportsTeams

  def __repr__(self):
    schoolRepr = super().__repr__() + " The avaiable sports teams are: "
    for team in self.sportsTeams:
      schoolRepr += f"{team} "
    return schoolRepr

  def getSportsTeams(self):
    return self.sportsTeams


c = HighSchool("Codecademy High", 500, ["Tennis", "Basketball"])
print(c.getSportsTeams())
print(c)
