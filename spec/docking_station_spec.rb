require 'docking_station'
require 'bike'


describe DockingStation do

  docking_station=DockingStation.new

    let(:bike_good) {double :bike_good}
    let(:bike_bad) {double :bike_bad}
    #allow(bike_good).to receive(:not_working?).and_return(false)
    #allow(bike_bad).to receive(:not_working?).and_return(true)


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
    expect(docking_station.capacity.is_a?(Fixnum)).to eq true
  end

  it "knows how many spaces it has" do
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
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

docking_station1=DockingStation.new

  it "stores each bike in a space in an array" do
    expect(docking_station1.bike_array[0..4].all?{|a| a.is_a?(Bike)}).to eq true
  end

  it "returns empty bike spaces as nil in bike_array" do
    expect(docking_station1.bike_array[5..DockingStation::DEFAULT_CAPACITY].all?{|a| a.nil?}).to eq true
  end

  it "checks if there is a space" do
    expect(docking_station.bike_array.include?(nil)).to eq true
  end

  it "tells you bike has been docked" do
    expect(docking_station.dock_bike(bike_good)).to eq "bike has been docked"
  end

  it "adds a bike to the first empty space" do
    allow(bike_good).to receive(:is_a?).and_return(true)
    docking_station.dock_bike(bike_good)
    expect(docking_station.bike_array[docking_station.bikes].is_a?(Bike)).to eq true
  end

  docking_station2 = DockingStation.new(12,12)

  it "says it's full if there are no spaces" do
    expect{docking_station2.dock_bike(:bike)}.to raise_exception "docking station is full"
  end

  it "won't let you get a new bike if there are no spaces" do
    12.times do docking_station2.release_bike end
    expect {docking_station2.release_bike}.to raise_error("No bikes available")
  end

  docking_station4=DockingStation.new
  it "allows you to specify if a given bike is broken" do
    allow(bike_bad).to receive(:not_working?).and_return(true)
    allow(bike_bad).to receive(:broken)
    docking_station4.dock_bike(bike_bad,true)
    expect(docking_station4.bike_array[5].not_working?).to eq true
  end


  it "raises an error if all bikes are broken" do
    docking_station5=DockingStation.new(10,0)
    allow(bike_bad).to receive(:not_working?).and_return(true)
    allow(bike_bad).to receive(:broken)
    docking_station5.dock_bike(bike_bad,true)
    docking_station5.dock_bike(bike_bad,true)
    expect {docking_station5.release_bike}.to raise_error("All bikes are broken")
  end

  it 'does not release broken bike and skips to a functioning one' do
    allow(bike_bad).to receive(:not_working?).and_return(true)
    allow(bike_bad).to receive(:broken)
    allow(bike_bad).to receive(:is_a?).and_return(true)
    docking_station6=DockingStation.new
    docking_station6.bike_array[0]=nil
    docking_station6.dock_bike(bike_bad,1234)
    docking_station6.release_bike
    expect(docking_station6.bike_array[0].is_a?(Bike)&&docking_station6.bike_array[1]==nil).to eq true
  end


end
