require_relative './bike'
class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader(:spaces, :bikes, :bike_array)
  def initialize(spaces =DEFAULT_CAPACITY, bikes = 5)
    @spaces = spaces
    @bikes = bikes
    @bike_array = Array.new(spaces)
    i = 0
    while i < bikes
      @bike_array[i] = Bike.new
      i += 1
    end
  end

  def bike_count
    @bike_array.count {|a| a.is_a?(Bike)}
  end

  def release_bike
      if empty?
        fail "No bikes available"
      else
        b1index=@bike_array.index{|a| a.is_a?(Bike)}
        releasedbike=@bike_array[b1index]; @bike_array[b1index]=nil; return releasedbike
      end
  end

  def dock_bike
      @first_space = @bike_array.index(nil)
      if full?
        raise "docking station is full"
      else
        @bike_array[@first_space] = Bike.new
        "bike has been docked"
      end
  end

def full?
  !@first_space
end

def empty?
  bike_array.all?{|a| a.nil?}
end

private :full?, :empty?
end


asdf=DockingStation.new
asdf.bikes
asdf.dock_bike
asdf.dock_bike
p asdf.bike_count
asdf.release_bike
p asdf.bike_count
