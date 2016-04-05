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
		end

		def switch_players
			@player1, @player2 = @player2, @player1
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
		def initialize(input = {})
			@board = input.fetch(:board, default_grid)
		end

		def get_cell(x, y)
			board[y][x]
		end

		def set_cell(x, y, new_value)
			get_cell(x, y).value = new_value
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		def default_grid
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


#puts "Welcome to Connect Four!"

#player1 = ConnectFour::Player.new("X")
#player2 = ConnectFour::Player.new("O")
#players = [player1, player2]
#ConnectFour::Game.new(players).start

#g = ConnectFour::Game.new
#g.start