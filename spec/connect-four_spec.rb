# Connect Four TDD (Rspec)

require 'spec_helper'

describe ConnectFour::Game do
	before do
		@player1 = ConnectFour::Player.new("X")
		@player2 = ConnectFour::Player.new("O")
		@players = [@player1, @player2]
		@game = ConnectFour::Game.new(@players)
	end
end

describe ConnectFour::Board do
	describe "#default_grid" do
		before { @board = ConnectFour::Board.new }

		it "should create a board with 6 rows" do
			expect(@board.default_grid.size).to eq(6)
		end

		it "should create a board with 7 columns" do
			expect(@board.default_grid.all? { |row| row.size == 7 }).to be_truthy
		end
	end
end

describe ConnectFour::Player do
	before { @player = ConnectFour::Player.new("X") }

	it "should assign the symbol X to the created player" do
		expect(@player.mark).to eq("X")
	end
end
