class Point
  attr_reader :x, :y

  def initialize(x, y)
    self.x = x
    self.y = y
  end

  private

  attr_writer :x, :y
end
