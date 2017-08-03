require "./lib/docking_station"
require "./lib/bike"
# docking_station = DockingStation.new
# p docking_station.bike_array
# p bike = docking_station.release_bike
# p bike.working?
# p docking_station.bike_array

#
puts "jenny feature test"


docking_station = DockingStation.new

p docking_station.bike_array.all? { |a| a.is_a?(Bike) }
# p docking_station1.bike_array
# 20.times {docking_station1.dock_bike}
#
# p docking_station1.bike_array
