class Move
  def initialize(board, from_point, to_point)
    self.board = board
    self.from_point = from_point
    self.to_point = to_point
  end

  def valid?
    true
  end

  def execute
    return unless valid?
    from_square = board.square_at(from_point)
    to_square = board.square_at(to_point)
    to_square.add_piece(from_square.piece)
    from_square.remove_piece
  end

  private

  attr_accessor :board, :from_point, :to_point
end
