require 'docking_station'
require 'bike'


describe DockingStation do

  docking_station=DockingStation.new

  it "Recognises release_bike" do
    expect(docking_station).to respond_to(:release_bike)
  end

  it "when release_bike called gives new Bike" do
    expect(docking_station.release_bike.is_a?(Bike)).to eq true
  end

  it "when docking a bike, the docking station notices" do
    expect(docking_station).to respond_to(:dock_bike)
  end

  it "knows how many spaces it has" do
    expect(docking_station.spaces.is_a?(Fixnum)).to eq true
  end

  it "knows how many spaces it has" do
    expect(docking_station.spaces).to eq 10
  end

  it "knows how many bikes it has" do
    expect(docking_station.bikes.is_a?(Fixnum)).to eq true
  end

  it "knows how many bikes it has" do
    expect(docking_station.bikes).to eq 5
  end

  it "stores bikes as an array" do
    expect(docking_station.bike_array.is_a?(Array)).to eq true
  end

  it "stores bikes as an array" do
    expect(docking_station.bike_array[0..4].all?{|a| a.is_a?(Bike)}).to eq true
  end

  it "stores bikes as an array" do
    expect(docking_station.bike_array[5..9].all?{|a| a.nil?}).to eq true
  end

end
