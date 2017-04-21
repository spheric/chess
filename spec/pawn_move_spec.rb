require 'spec_helper'

describe PawnMove do
  subject(:pawn_move) { described_class.new(board, from_point, to_point) }
  let(:board) { Board.new }

  describe '#valid?' do
    subject(:valid?) { pawn_move.valid? }

    context 'move rook' do
      let(:from_point) { ChessBoardPoint.new(0, 0) }
      let(:to_point) { ChessBoardPoint.new(0, 2) }
      it { is_expected.to be false }
    end

    context 'move white pawn' do
      let(:from_point) { ChessBoardPoint.new(0, 1) }

      context 'forward' do
        let(:to_point) { ChessBoardPoint.new(0, 2) }
        it { is_expected.to be true }
      end

      context 'forward 2' do
        let(:to_point) { ChessBoardPoint.new(0, 3) }
        it { is_expected.to be true }
      end

      context 'diagonal for a take' do
        let(:to_point) { ChessBoardPoint.new(1, 2) }

        before do
          square = board.square_at(to_point)
          square.add_piece(Pawn.new(color))
        end

        context 'when black' do
          let(:color) { :black }
          it { is_expected.to be true }
        end

        context 'when white' do
          let(:color) { :white }
          it { is_expected.to be false }
        end
      end

      context 'forward 3' do
        let(:to_point) { ChessBoardPoint.new(0, 4) }
        it { is_expected.to be false }
      end

      context 'to other side of board' do
        let(:to_point) { ChessBoardPoint.new(0, 4) }
        it { is_expected.to be false }
      end

      context 'diagonal for a take when no other piece' do
        let(:to_point) { ChessBoardPoint.new(1, 4) }
        it { is_expected.to be false }
      end

      context 'forward onto occupied square' do
        let(:to_point) { ChessBoardPoint.new(0, 4) }

        before do
          square = board.square_at(to_point)
          square.add_piece(Pawn.new(color))
        end

        context 'when black' do
          let(:color) { :black }
          it { is_expected.to be false }
        end

        context 'when white' do
          let(:color) { :white }
          it { is_expected.to be false }
        end
      end
    end

    context 'move black pawn' do
      let(:from_point) { ChessBoardPoint.new(7, 6) }

      context 'forward' do
        let(:to_point) { ChessBoardPoint.new(7, 5) }
        it { is_expected.to be true }
      end

      context 'forward 2' do
        let(:to_point) { ChessBoardPoint.new(7, 4) }
        it { is_expected.to be true }
      end

      context 'diagonal for a take' do
        let(:to_point) { ChessBoardPoint.new(6, 5) }

        before do
          square = board.square_at(to_point)
          square.add_piece(Pawn.new(color))
        end

        context 'when black' do
          let(:color) { :black }
          it { is_expected.to be false }
        end

        context 'when white' do
          let(:color) { :white }
          it { is_expected.to be true }
        end
      end

      context 'forward 3' do
        let(:to_point) { ChessBoardPoint.new(7, 3) }
        it { is_expected.to be false }
      end

      context 'to other side of board' do
        let(:to_point) { ChessBoardPoint.new(0, 4) }
        it { is_expected.to be false }
      end

      context 'diagonal for a take when no other piece' do
        let(:to_point) { ChessBoardPoint.new(1, 4) }
        it { is_expected.to be false }
      end

      context 'forward onto occupied square' do
        let(:to_point) { ChessBoardPoint.new(0, 4) }

        before do
          square = board.square_at(to_point)
          square.add_piece(Pawn.new(color))
        end

        context 'when black' do
          let(:color) { :black }
          it { is_expected.to be false }
        end

        context 'when white' do
          let(:color) { :white }
          it { is_expected.to be false }
        end
      end
    end
  end
end
