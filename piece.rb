class Piece
  attr_reader :colour
  
  def initialize(colour)
    self.colour = colour
  end

  def valid_move?(from, to)
    raise NotImplementedError
  end

  private

  attr_writer :colour
end
