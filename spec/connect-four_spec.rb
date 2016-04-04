# Connect Four TDD (Rspec)

require 'spec_helper'

describe ConnectFour::Board do
	describe "#new_board" do
		before { @board = ConnectFour::Board.new }

		it "should create a board with 6 rows" do
			expect(@board.new_board.size).to eq(6)
		end

		it "should create a board with 7 columns" do
			expect(@board.new_board.all? { |row| row.size == 7 }).to be_truthy
		end
	end
end
