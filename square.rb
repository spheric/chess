class Square
  attr_reader :piece

  def add_piece(piece)
    raise 'You cannot add a piece, this square is already occupied' if @piece
    self.piece = piece
  end

  def remove_piece
    self.piece = nil
  end

  private

  attr_writer :piece
end
