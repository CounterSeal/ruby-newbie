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
end
