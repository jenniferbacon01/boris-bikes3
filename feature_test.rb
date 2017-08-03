require "./lib/docking_station"
require "./lib/bike"
docking_station = DockingStation.new
p bike = docking_station.release_bike
p bike.working?
p docking_station.dock_bike
p @bike_array

puts "jenny feature test"

docking_station1 = DockingStation.new(20,0)

20.times {docking_station1.dock_bike}

p @bike_array
