
require 'bike'

describe Bike do

  bike=Bike.new

  it "Recognises .not_working? method" do
    expect(bike).to respond_to(:not_working?)
  end

  it "checks that the bike is working" do
    expect(bike.not_working?).to eq false
  end
end
