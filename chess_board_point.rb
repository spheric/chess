class ChessBoardPoint
  attr_reader :x, :y

  def initialize(x, y)
    raise ArgumentError if x < 0 || x > 7 || y < 0 || y > 7
    self.x = x
    self.y = y
  end

  private

  attr_writer :x, :y
end
