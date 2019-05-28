This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite Optional

>>> from ants import *
>>> hive, layout = Hive(AssaultPlan()), dry_layout
>>> dimensions = (1, 9)
>>> colony = AntColony(None, hive, ant_types(), layout, dimensions)
>>> laser = LaserAnt()
>>> ant = HarvesterAnt(2)
>>> bee1 = Bee(2)
>>> bee2 = Bee(2)
>>> bee3 = Bee(2)
>>> bee4 = Bee(2)
>>> colony.places["tunnel_0_0"].add_insect(laser)
>>> colony.places["tunnel_0_0"].add_insect(bee4)
>>> colony.places["tunnel_0_3"].add_insect(bee1)
>>> colony.places["tunnel_0_3"].add_insect(bee2)
>>> colony.places["tunnel_0_4"].add_insect(ant)
>>> colony.places["tunnel_0_5"].add_insect(bee3)

	Case 1
  >>> laser.action(colony)
  >>> round(bee4.armor, 2)
  0.0
  >>> round(bee1.armor, 2)
  0.65
  >>> round(bee2.armor, 2)
  0.7
  >>> round(ant.armor, 2)
  0.95
  >>> round(bee3.armor, 2)
  1.2

	Case 2
  >>> laser.action(colony)
  >>> round(bee4.armor, 2)
  0.0
  >>> round(bee1.armor, 2)
  -0.5
  >>> round(bee2.armor, 2)
  -0.4
  >>> round(ant.armor, 2)
  0.1
  >>> round(bee3.armor, 2)
  0.6

	Case 3
  >>> laser.action(colony)
  >>> round(bee4.armor, 2)
  0.0
  >>> round(bee1.armor, 2)
  -0.5
  >>> round(bee2.armor, 2)
  -0.4
  >>> round(ant.armor, 2)
  -0.65
  >>> round(bee3.armor, 2)
  0.1
