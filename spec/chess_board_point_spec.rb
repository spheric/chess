require 'spec_helper'

describe ChessBoardPoint do
  subject(:chess_board_point) { described_class.new(x, y) }
  let(:x) { 0 }
  let(:y) { 0 }

  describe 'Constructor' do
    specify do
      expect { chess_board_point }.not_to raise_error
    end

    context 'set invalid points' do 
      let(:x) { -10 }

      specify do
        expect { chess_board_point }.to raise_error ArgumentError
      end
    end
  end
end

