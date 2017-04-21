require 'spec_helper'

describe Square do
  subject(:square) { described_class.new }
  let(:piece) { Piece.new(:white) }

  describe '#add_piece' do
    subject(:add_piece) { square.add_piece(piece) }
    specify do
      add_piece
      expect(square.piece).not_to be_nil
    end

    context 'square already has piece' do
      before do
        square.add_piece(piece)
      end

      specify do
        expect { add_piece }.to raise_error RuntimeError, /square is already occupied/
      end
    end
  end
end
