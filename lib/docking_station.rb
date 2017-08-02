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
    p Bike.new
  end

  def dock_bike
    first_space = @bike_array.index(nil)
      if first_space
        @bike_array[first_space] = Bike.new
        "bike has been docked"
      else
        "docking station is full"
    end
  end


end

p asdf=DockingStation.new(6,5)
p asdf.bike_array
p asdf.bike_array.class
