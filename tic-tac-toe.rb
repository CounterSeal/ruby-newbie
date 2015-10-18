# Tic Tac Toe
# Build a tic-tac-toe game on the command line where two human players can play against
# each other and the board is displayed in between turns.

module TicTacToe
	class Cell
		attr_accessor :value
		def initialize(value = "")
			@value = value
		end
	end

	class Game
		attr_reader :players, :board, :current_player, :other_player
		def initialize(players, board = Board.new)
			@players = players
			@board = board
			@current_player, @other_player = players.shuffle
		end

		def switch_players
			@current_player, @other_player = @other_player, @current_player
		end

		def solicit_move
			puts "#{current_player}, make a move! (Enter a number between 1 and 9)"
		end

		def get_move(human_move = gets.chomp)
			human_move_to_coordinate(human_move)
		end

		private

		def human_move_to_coordinate(human_move)
			mapping = {
				"1" => [0, 0],
				"2" => [1, 0],
				"3" => [2, 0],
				"4" => [0, 1],
				"5" => [1, 1],
				"6" => [2, 1],
				"7" => [0, 2],
				"8" => [1, 2],
				"9" => [2, 2]
			}
			mapping[human_move]
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

		def get_cell(x, y)
			grid[y][x]
		end

		def set_cell(x, y, new_value)
			get_cell(x, y).value = new_value
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		def draw?
			cells = grid.flatten.map { |cell| cell.value }
			return true if cells.any? { |cell| cell.to_s.empty? } == false
			false
		end

		def winner?
		end

		def winning_combos
			grid +
			grid.transpose +
			diagonals
		end

		def diagonals
			[
				[get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
				[get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
			]
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
