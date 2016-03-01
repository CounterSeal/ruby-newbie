# Tic Tac Toe
# Build a tic-tac-toe game on the command line where two human players can play against
# each other and the board is displayed in between turns.

require 'colorize'

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
			puts "#{current_player.name} [#{current_player.mark}], make your move! (Enter a number between 1 and 9)"
		end

		def get_move
			while true
				human_move = gets.chomp
				x, y = human_move_to_coordinate(human_move)
				if human_move.length < 2 && human_move.to_i.between?(1, 9)
					if board.get_cell(x, y).value == current_player.mark || board.get_cell(x, y).value == other_player.mark
						puts "That move is taken! Choose another.".red
					else
						return x, y
					end
				else
					puts "Enter a whole number between 1 and 9.".red
				end
			end
		end

		def game_over_message
			puts "#{current_player.name} [#{current_player.mark}] won!" if board.game_over == :winner
			puts "The game ended in a tie!" if board.game_over == :draw
		end

		def play
			puts "#{current_player.name} makes the first move!"
			while true
				board.formatted_grid
				puts ""
				solicit_move
				x, y = get_move
				board.set_cell(x, y, current_player.mark)
				if board.game_over
					board.formatted_grid
					game_over_message
					return
				else
					switch_players
				end
			end
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

		def formatted_grid
			grid.each do |row|
				puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
			end
		end

		private

		def default_grid
			Array.new(3) { Array.new(3) { Cell.new } }
		end

		def draw?
			cells = grid.flatten.map { |cell| cell.value }
			return true if cells.any? { |cell| cell.to_s.empty? } == false
			false
		end

		def winner?
			winning_combos.each do |winning_combo|
				values = winning_combo.map { |cell| cell.value }
				next if values.all? { |cell| cell.to_s.empty? } == true
				return true if values.all? { |cell| cell == values[0] } == true
			end
			false
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


#puts "Welcome to tic tac toe!".green
#player1 = TicTacToe::Player.new({mark: "X".yellow, name: "Player One"})
#player2 = TicTacToe::Player.new({mark: "O".magenta, name: "Player Two"})
#players = [player1, player2]
#TicTacToe::Game.new(players).play
