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
      @bike_array[i] = [Bike.new, true]
      i += 1
    end

    while i < spaces
      @bike_array[i]= [nil,nil]
      i+=1
    end
  end

  def release_bike
    if empty?
      fail ("docking station is empty")
    elsif @bike_array.reverse.find{|x| x[1]==true}
      bike_produced = @bike_array.reverse.find{|x| x[1]==true}[0]
    else
      bike_produced = "no available working bikes"
    end
    bike_produced
  end

=begin
elsif full?
  if @bike_array[-1][1] == true
    bike_produced = @bike_array[-1]
    @bike_array[-1] = nil
  else
    bike_produced = "unable to release bike as it is broken"
  end

first_bike = @bike_array.index(nil) - 1
if @bike_array[first_bike][1] == true
  bike_produced = @bike_array[first_bike]
  @bike_array[first_bike] = nil
elsif
  bike_produced = @bike_array.reverse.find{|x| x[1]==true}
else
  bike_produced = "unable to release bike as it is broken"
end
=end

  def dock_bike(bike, working)
    first_space = @bike_array.index([nil,nil])
    fail("docking station full") unless first_space
    @bike_array[first_space] = [bike, working]
    "bike has been docked"

  end

private

  def full?
    @bike_array.all? {|i| !i[0].nil?}
  end

  def empty?
    @bike_array.all? {|i| i[0].nil?}
  end

end
