
require 'bike'

describe Bike do

  bike=Bike.new

  it "Recognises .working? method" do
    expect(bike).to respond_to(:working?)
  end

  it "checks that the bike is working" do
    expect(bike.working?).to eq true
  end
end
