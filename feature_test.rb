require "./lib/docking_station"
require "./lib/bike"
docking_station = DockingStation.new
bike = docking_station.release_bike
bike.working?
docking_station.dock_bike

docking_station1 = DockingStation.new(10,10)
docking_station1.dock_bike
