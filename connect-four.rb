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
			while true
				get_move

			end
		end

		def get_move
			while true
				human_move = gets.upcase.chomp
				x, y = human_move_to_coordinate(human_move)
				if human_move.length < 3
					if board.get_cell(x, y).value == player1.mark || board.get_cell(x, y).value == player2.mark
						puts "That move is taken! Choose another."
					else
						return x, y
					end
				else
					puts "Enter an appropriate letter and number combination."
				end
			end
		end

		def switch_players
			@player1, @player2 = @player2, @player1
		end

		def human_move_to_coordinate(human_move)
			mapping = {
				"A1" => [0, 0],
				"A2" => [1, 0],
				"A3" => [2, 0],
				"A4" => [3, 0],
				"A5" => [4, 0],
				"A6" => [5, 0],
				"B1" => [0, 1],
				"B2" => [1, 1],
				"B3" => [2, 1],
				"B4" => [3, 1],
				"B5" => [4, 1],
				"B6" => [5, 1],
				"C1" => [0, 2],
				"C2" => [1, 2],
				"C3" => [2, 2],
				"C4" => [3, 2],
				"C5" => [4, 2],
				"C6" => [5, 2],
				"D1" => [0, 3],
				"D2" => [1, 3],
				"D3" => [2, 3],
				"D4" => [3, 3],
				"D5" => [4, 3],
				"D6" => [5, 3],
				"E1" => [0, 4],
				"E2" => [1, 4],
				"E3" => [2, 4],
				"E4" => [3, 4],
				"E5" => [4, 4],
				"E6" => [5, 4],
				"F1" => [0, 5],
				"F2" => [1, 5],
				"F3" => [2, 5],
				"F4" => [3, 5],
				"F5" => [4, 5],
				"F6" => [5, 5],
				"G1" => [0, 6],
				"G2" => [1, 6],
				"G3" => [2, 6],
				"G4" => [3, 6],
				"G5" => [4, 6],
				"G6" => [5, 6]
			}
			mapping[human_move]
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