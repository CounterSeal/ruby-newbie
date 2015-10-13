# Tic Tac Toe
# Build a tic-tac-toe game on the command line where two human players can play against
# each other and the board is displayed in between turns.

module TicTacToe
	class Cell
		attr_accessor :value
		def initialize(value = '')
			@value = value
		end
	end

	class Board
		attr_reader :grid
		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		private

		def default_grid
			Array.new(3) { Array.new(3) { Cell.new } }
		end
	end

	class Player
		attr_accessor :mark, :name
		def initialize(input)
			@mark = input.fetch(:mark)
			@name = input.fetch(:name)
		end
	end


end


newGame = TicTacToe::Player.new({ mark: "X", name: "CounterSeal" })

p newGame.mark
p newGame.name
