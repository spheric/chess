class Board
  def initialize
    self.squares = Array.new(8) { Array.new(8) { Square.new } }
    reset
  end

  def move_piece(from_point, to_point)
    piece = square_at(from_point).piece
    return false if piece.nil?
    move = piece.move_class.new(self, from_point, to_point)
    move_valid = move.valid?
    move.execute if move_valid
    move_valid
  end

  def square_at(point)
    squares[point.x][point.y]
  end

  def reset
    squares.flatten.each(&:remove_piece)
    reset_pawns
    reset_major_pieces
  end

  private

  attr_accessor :squares

  def reset_pawns
    (0..7).each do |column_index|
      column = squares[column_index]
      column[1].add_piece(Pawn.new(:white))
      column[6].add_piece(Pawn.new(:black))
    end
  end

  def reset_major_pieces
    %i[white black].each do |colour|
      row_index = colour == :white ? 0 : 7

      (0..7).each do |column_index|
        piece_class = major_piece_for_column(column_index, colour)
        squares[column_index][row_index].add_piece(piece_class.new(colour))
      end
    end
  end

  def major_piece_for_column(column_index, colour)
    is_white = colour == :white
    case column_index
    when 0
      Rook
    when 1
      Knight
    when 2
      Bishop
    when 3
      is_white ? King : Queen
    when 4
      is_white ? Queen : King
    when 5
      Bishop
    when 6
      Knight
    when 7
      Rook
    end
  end
end
