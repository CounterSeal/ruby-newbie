# Tic-Tac-Toe (Rspec):

require 'spec_helper'

describe TicTacToe do
	describe '::Board' do
			before do
				@board = Board.new
				@board.set_cell(0, 0, "X")
			end

			describe '#game_over' do
				it "should be false" do
					expect(@board.game_over).to eq(false)
				end
		end
	end
end
