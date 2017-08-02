#require 'bike'
class DockingStation

  attr_reader(:spaces, :bikes, :bike_array)

  def initialize(spaces = 10, bikes = 5)
    @spaces = spaces
    @bikes = bikes
    @bike_array = Array.new(spaces)
    # i = 0
    # while i < bikes
    #   @bike_array << Bike.new
    #   i += 1
    # end
  end

  def bike_array

  end


  def release_bike
    p Bike.new
  end

  def dock_bike
  end



end
