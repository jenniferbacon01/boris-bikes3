require "./lib/docking_station"
require "./lib/bike"
docking_station = DockingStation.new
bike = docking_station.release_bike
bike.working?
docking_station.dock_bike

puts "jenny feature test"

docking_station1 = DockingStation.new(10,0)
docking_station1.release_bike
p docking_station1.bike_array
