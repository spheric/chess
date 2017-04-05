class Board
  def move_piece(piece, from_point, to_point)
    move = Move.new(self, piece, from_point, to_point)
    move_valid = move.valid?
    move.execute if move_valid
    move_valid
  end
end
