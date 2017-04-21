class PawnMove < Move
  def valid?
    moving_pawn? && (valid_move_to_unoccupied_square? ||
                     valid_move_to_occupied_square?)
  end

  private

  def moving_pawn?
    move_piece.is_a? Pawn
  end

  def valid_move_to_unoccupied_square?
    take_piece.nil? && (moving_forward?(1) || moving_forward?(2))
  end

  def valid_move_to_occupied_square?
    !take_piece.nil? && take_piece_is_opposition? && moving_forward_diagonally_one?
  end

  def take_piece_is_opposition?
    move_piece.colour != take_piece.colour
  end

  def moving_forward_diagonally_one?
    ((black? && row_move == -1) || (white? && row_move == 1)) &&
      column_move.abs == 1
  end

  def column_move
    to_point.x - from_point.x
  end

  def moving_forward?(rows)
    move_in_same_column? && ((black? && row_move == rows * -1) ||
                             (white? && row_move == rows))
  end

  def move_in_same_column?
    to_point.x == from_point.x
  end

  def white?
    move_piece.colour == :white
  end

  def black?
    move_piece.colour == :black
  end

  def row_move
    to_point.y - from_point.y
  end
end
