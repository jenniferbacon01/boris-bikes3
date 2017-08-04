#require 'bike'
class DockingStation

  attr_accessor(:spaces, :bikes, :bike_array)
  DEFAULT_CAPACITY = 20

  def initialize(spaces = DEFAULT_CAPACITY, bikes = 20)
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
    if empty?
      fail ("docking station is empty")
    elsif full?
      bike_produced = @bike_array[-1]
      @bike_array[-1] = nil
    else
      first_bike = @bike_array.index(nil) - 1
      bike_produced = @bike_array[first_bike]
      @bike_array[first_bike] = nil
    end
    bike_produced
  end

  def dock_bike
    first_space = @bike_array.index(nil)
    fail("docking station full") unless first_space
    @bike_array[first_space] = Bike.new
    "bike has been docked"

  end

private

  def full?
    @bike_array.all? {|i| i.is_a?(Bike)}
  end

  def empty?
    @bike_array.all? {|i| i.nil?}
  end

end
