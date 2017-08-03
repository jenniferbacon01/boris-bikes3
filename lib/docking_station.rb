#require 'bike'
class DockingStation

  attr_accessor(:spaces, :bikes, :bike_array, :docking_status)

  def initialize(spaces = 20, bikes = 20)
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
    case docking_status
      when @bike_array.all? {|i| i.nil?}
        fail ("docking station is empty")
      when @bike_array.all? {|i| i.is_a?(Bike)}
        @bike_array[-1] = nil
      when first_bike = @bike_array.index(nil) - 1
        @bike_array[first_bike] = nil
    end

  end

  def dock_bike
    first_space = @bike_array.index(nil)
    fail("docking station full") unless first_space
    @bike_array[first_space] = Bike.new
    "bike has been docked"

  end


end
