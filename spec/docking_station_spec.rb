require 'docking_station'
require 'bike'


describe DockingStation do

  docking_station=DockingStation.new

  it "Recognises release_bike" do
    expect(docking_station).to respond_to(:release_bike)
  end

  it "when release_bike called gives new Bike" do
    expect((docking_station.release_bike)[0].is_a?(Bike)).to eq true
  end

  it "when docking a bike, the docking station notices" do
    expect(docking_station).to respond_to(:dock_bike)
  end

  it "knows how many spaces it has" do
    expect(docking_station.spaces.is_a?(Fixnum)).to eq true
  end

  it "knows how many spaces it has" do
    expect(docking_station.spaces).to eq 20
  end

  it "when instantiated with 10 spaces, it has 10 spaces" do
    docking_station6 = DockingStation.new(10,0)
    expect(docking_station6.spaces).to eq 10
  end

  it "knows how many bikes it has" do
    expect(docking_station.bikes.is_a?(Fixnum)).to eq true
  end

  it "knows how many bikes it has" do
    expect(docking_station.bikes).to eq 20
  end

  it "stores bikes as an array" do
    expect(docking_station.bike_array.is_a?(Array)).to eq true
  end

  it "creates 20 bikes" do
    docking_station4 = DockingStation.new
    expect(docking_station4.bike_array.all? { |a| a[0].is_a?(Bike) } ).to eq true
  end

  it "checks if there is a space" do
    expect(docking_station.bike_array.include?(nil)).to eq true
  end

  it "checks if there docking station is full" do
    docking_station2 = DockingStation.new(10,10)
    bike2 = Bike.new
    expect{docking_station2.dock_bike(bike2,true)}.to raise_error("docking station full")
  end

  it "checks if there docking station is empty" do
    docking_station2 = DockingStation.new(10,0)
    expect{docking_station2.release_bike}.to raise_error("docking station is empty")
  end

  it "tells you bike has been docked" do
    bike3 = Bike.new
    expect(docking_station.dock_bike(bike3, true)).to eq "bike has been docked"
  end

  it "adds a bike to the first empty space" do
    docking_station1 = DockingStation.new(20,10)
    bike4 = Bike.new
    docking_station1.dock_bike(bike4, true)
    expect(docking_station1.bike_array[10][0].is_a?(Bike)).to eq true
  end

  it "logs if the bike is not working when docking bike" do
    docking_station7 = DockingStation.new(20,10)
    bike7 = Bike.new
    docking_station7.dock_bike(bike7, false)
    expect(docking_station7.bike_array[10]).to eq [bike7,false]
  end

  it "does not release a bike if the last bike is broken" do
    docking_station8 = DockingStation.new(10,5)
    bike8 = Bike.new
    docking_station8.dock_bike(bike8,false)
    expect(docking_station8.release_bike).to eq "unable to release bike as it is broken"
  end




end
