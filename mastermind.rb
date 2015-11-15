# Mastermind
# Mastermind is a game where you have to guess your opponent's secret code within a certain number
# of turns (like hangman with colored pegs). Each turn you get some feedback about how good your
# guess was -- whether it was exactly correct or just the correct color but in the wrong space.

require 'colorize'

module Mastermind
=begin
	class Cell
		attr_accessor :value
		def initialize(value = "")
			@value = value
		end
	end
=end

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
			@answer = 'rycc'
			#@answer = 4.times.map { ['b', 'g', 'c', 'p', 'r', 'y'].sample }.join
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

				feedback(guesses)
				evaluate
				puts "\n"
				guesses -= 1
			end
		end

		def feedback(guesses)
			puts "Try again! (#{guesses} guesses left)" if guesses >= 2
			puts "Try again! (1 guess left)" if guesses == 1
			puts "You lose." if guesses == 0
		end

		def evaluate #answer array still not deleting elements correctly. rcpr and ycrc
			guess = @guess.split('')
			answer = @answer.split('')
			correct_all = 0
			correct_color = 0
			leftover_guess = []
			leftover_answer = answer

			i = 0
			guess.each_with_index do |a, index|
				if a == answer[i]
					correct_all += 1
					leftover_answer.delete_at(index)
				else
					leftover_guess << a
				end
				i += 1
			end

			#leftover_answer = answer - leftover_answer

			leftover_guess.each do |x|
				leftover_answer.each_with_index do |a, index|
					if x == a
						correct_color += 1
						leftover_answer.delete_at(index)
						break
					end
				end
			end

			puts "#{correct_all} correct colors in the right place. #{correct_color} correct colors found."
			puts "Leftover Guess: #{leftover_guess.join}"
			puts "Leftover Answer: #{leftover_answer.join}"
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
		def initialize(name = "Codebreaker1337")
			@name = name
		end
	end
end


g = Mastermind::Game.new
g.start