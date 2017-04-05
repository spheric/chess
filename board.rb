class Board
  def move_piece(piece, from_point, to_point)
    Move.new(self, piece, from_point, to_point).valid?
  end
end
