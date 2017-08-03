#require 'bike'
class DockingStation

  attr_reader(:spaces, :bikes, :bike_array)

  def initialize(spaces = 10, bikes = 5)
    @spaces = spaces
    @bikes = bikes
    @bike_array = Array.new(spaces)
    i = 0
    while i < bikes
      @bike_array[i] = Bike.new
      i += 1
    end
  end

  def release_bike
    p @bike_array.nil?
    if @bike_array.nil?
      fail ("docking station is empty")
    else
      first_bike = @bike_array.index(nil) - 1
      @bike_array[first_bike]
    end
  end

  def dock_bike
    first_space = @bike_array.index(nil)
    fail("docking station full") unless first_space
    @bike_array[first_space] = Bike.new
    "bike has been docked"

  end


end
