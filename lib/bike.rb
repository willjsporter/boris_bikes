class Bike

  def initialize(status=false)
    @status=status
  end

  def broken
    @status=true
  end

  def not_working?
    @status
  end
end
