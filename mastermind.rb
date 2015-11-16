# Mastermind
# Mastermind is a game where you have to guess your opponent's secret code within a certain number
# of turns (like hangman with colored pegs). Each turn you get some feedback about how good your
# guess was -- whether it was exactly correct or just the correct color but in the wrong space.

require 'colorize'

module Mastermind
	class Game
		attr_reader :game
		def initialize
			@game = game
		end

		def start
			puts "Welcome to MASTERMIND. Let the games, begin!"
			puts "Ready, Player One? Y/N"
			choice = gets.chomp.downcase
			choice == "y" ? play : quit
		end

		def quit
			puts "Goodbye!"
			exit
		end

		def play
			player = Player.new
			board = Board.new
			puts "#{player.name}, take your guess!"
			puts board.solution
			board.start
		end
	end

	class Board
		attr_accessor :answer, :guess
		def initialize
			@answer = answer
			@guess = guess
			#@grid = grid
		end

		def solution
			#@answer = 'brby'
			#@answer = 'rycc'
			@answer = 4.times.map { ['b', 'g', 'c', 'p', 'r', 'y'].sample }.join
			#@answer = 4.times.map { ['b'.blue, 'g'.green, 'c'.cyan, 'p'.magenta, 'r'.red, 'y'.yellow].sample }.join
		end

		def start
			guesses = 11
			12.times do
				@guess = gets.chomp.downcase
				if @guess == @answer
					puts "You win!"
					break
				end

				evaluate
				feedback(guesses)
				puts "\n"
				guesses -= 1
			end
		end

		def feedback(guesses)
			case guesses
			when 2..11
				puts "Try again! (#{guesses} guesses left)" if guesses >= 2
			when 1
				puts "Try again! (1 guess left)" if guesses == 1
			when 0
				puts "You lose. Play again? Y/N" if guesses == 0
				new_game = Mastermind::Game.new
				choice = gets.chomp.downcase
				choice == "y" ? new_game.start : new_game.quit
			end
		end

		def evaluate
			guess = @guess.split('')
			answer = @answer.split('')
			correct_all = 0
			correct_color = 0
			leftover_guess = []
			leftover_answer = @answer.split('')

			i = 0
			guess.each_with_index do |a, index|
				if a == answer[i]
					correct_all += 1
					leftover_answer[index] = nil
				else
					leftover_guess << a
				end
				i += 1
			end

			leftover_answer -= [nil]

			leftover_guess.each do |x|
				leftover_answer.each_with_index do |a, index|
					if x == a
						correct_color += 1
						leftover_answer.delete_at(index)
						break
					end
				end
			end

			puts "#{correct_all} correct color(s) in the right place. #{correct_color} correct color(s) found."
			#puts "Leftover Guess: #{leftover_guess.join}"
			#puts "Leftover Answer: #{leftover_answer.join}"
		end
=begin
		def formatted_grid
			grid.each do |row|
				puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
			end
		end

		private

		def default_grid
			Array.new(12) { Array.new(4) { Cell.new } }
		end
=end
	end

	class Player
		attr_accessor :name
		def initialize(name = "Player One")
			@name = name
		end
	end
end


g = Mastermind::Game.new
g.start
