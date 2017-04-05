class Move

  def initialize(board, piece, from_point, to_point)
    self.board = board
    self.piece = piece
    self.from_point = from_point
    self.to_point = to_point
  end

  def valid?
    true
  end

  private

  attr_accessor :board, :piece, :from_point, :to_point
end
