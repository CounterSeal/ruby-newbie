# Connect Four

module ConnectFour
	class Game
		attr_accessor :board, :players, :player1, :player2
		def initialize(players, board = Board.new)
			@players = players
			@board = board
			@player1, @player2 = players.shuffle
		end

		def start
			@board = Board.new
			@board.create_board
			@player1 = Player.new("X")
		end
	end

	class Cell
		attr_accessor :value
		def initialize(value = "")
			@value = value
		end
	end

	class Board
		attr_reader :board
		def initialize
			@board = new_board
		end

		def new_board
			Array.new(6) { Array.new(7) { Cell.new } }
		end
	end

	class Player
		attr_accessor :mark
		def initialize(mark)
			@mark = mark
		end
	end
end

#g = ConnectFour::Game.new
#g.start
