require 'spec_helper'

describe Board do
  subject(:board) { described_class.new }

  describe '#move_piece' do
    let(:from_point) { ChessBoardPoint.new(0, 1) }
    let(:to_point) { ChessBoardPoint.new(0, 2) }
    let(:move) { instance_double(Move) }
    subject(:move_piece) { board.move_piece(from_point, to_point) }

    before do
      allow(Move)
        .to receive(:new)
        .with(board, from_point, to_point)
        .and_return(move)
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

  describe '#square_at' do
    subject(:square_at) { board.square_at(point).piece }

    context 'knight' do
      let(:point) { ChessBoardPoint.new(1, 0) }
      it { is_expected.to be_a Knight }
    end

    context 'king' do
      let(:point) { ChessBoardPoint.new(3, 0) }
      it { is_expected.to be_a King }
    end
  end

  describe '#reset' do
    subject(:reset) { board.reset }

    let(:from_point) { ChessBoardPoint.new(0, 1) }
    let(:to_point) { ChessBoardPoint.new(0, 2) }

    context 'after one move' do
      specify do
        board.move_piece(from_point, to_point)
        expect(board.square_at(to_point).piece).to be_a Pawn
        expect(board.square_at(to_point).piece.colour).to eq :white
        expect(board.square_at(from_point).piece).to be_nil

        reset

        expect(board.square_at(to_point).piece).to be_nil
        expect(board.square_at(from_point).piece).to be_a Pawn
      end
    end

    context 'after a bunch of moves' do
      specify do
        (0..7).each do |column|
          from_point = ChessBoardPoint.new(column, 1)
          to_point = ChessBoardPoint.new(column, 2)
          board.move_piece(from_point, to_point)
          expect(board.square_at(to_point).piece).to be_a Pawn
          expect(board.square_at(to_point).piece.colour).to eq :white
          expect(board.square_at(from_point).piece).to be_nil
        end

        reset

        (0..7).each do |column|
          from_point = ChessBoardPoint.new(column, 1)
          to_point = ChessBoardPoint.new(column, 2)
          expect(board.square_at(from_point).piece).to be_a Pawn
          expect(board.square_at(from_point).piece.colour).to eq :white
          expect(board.square_at(to_point).piece).to be_nil
        end
      end
    end
  end
end
