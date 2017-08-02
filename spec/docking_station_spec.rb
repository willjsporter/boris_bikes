

require_relative '../lib/docking_station'
require 'bike'


describe DockingStation do

  docking_station=DockingStation.new

  it "Recognises release_bike" do
    expect(docking_station).to respond_to(:release_bike)
  end

  it "when release_bike called gives new Bike" do
    expect(docking_station.release_bike.is_a?(Bike)).to eq true
  end

end
