require 'spec_helper'

describe Board do
  subject(:board) { described_class.new }
  describe 'move_piece' do
    let(:piece) { Pawn.new }
    let(:from_point) { Point.new(1, 2) }
    let(:to_point) { Point.new(1, 3) }
    let(:move) { instance_double(Move) }
    subject(:move_piece) { board.move_piece(piece, from_point, to_point) }

    before do
      allow(Move)
        .to receive(:new).with(board, piece, from_point, to_point).and_return(move)
    end

    context 'valid move' do
      before do
        allow(move).to receive(:valid?).and_return(true)
        expect(move).to receive(:execute)
      end

      it { is_expected.to eq true }
    end

    context 'invalid move' do
      before do
        allow(move).to receive(:valid?).and_return(false)
        expect(move).not_to receive(:execute)
      end

      it { is_expected.to eq false }
    end
  end
end
