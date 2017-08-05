require_relative './bike'
class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader(:capacity, :bikes, :bike_array)
  def initialize(capacity =DEFAULT_CAPACITY, bikes = 5)
    @capacity = capacity
    @bikes = bikes
    @bike_array = Array.new(@capacity)
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
        0.upto(@capacity-1) do |i|
          releasedbike=@bike_array[i]#[b1index+i]
          next if releasedbike==nil || releasedbike.not_working?
          @bike_array[i]=nil; return releasedbike
        end
        raise "All bikes are broken"
      end
  end

  def dock_bike(bike,arg=false)
      @first_space = @bike_array.index(nil)
      if full?
        raise "docking station is full"
      else
        @bike_array[@first_space] = bike
        bike.broken if !!arg
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

# asdf=DockingStation.new(10,0)
# asdf.dock_bike(Bike.new, true)
# p asdf.bike_array
#
# #asdf.release_bike
# # p asdf.bikes
# # p asdf.dock_bike("asdf")
# asdf.dock_bike(Bike.new)
# p asdf.bike_count
# asdf.release_bike
# p asdf.bike_count
