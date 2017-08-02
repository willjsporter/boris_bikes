require './bike'
class DockingStation
  def release_bike
    p Bike.new
  end
end

docking_station = DockingStation.new
docking_station.release_bike
