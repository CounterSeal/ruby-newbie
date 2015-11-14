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
			@answer = 4.times.map { ['b', 'g', 'c', 'p', 'r', 'y'].sample }.join
			#4.times.map { ['b'.blue, 'g'.green, 'c'.cyan, 'p'.magenta, 'r'.red, 'y'.yellow].sample }.join
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
				guesses -= 1
			end
		end

		def feedback(guesses)
			puts "Try again! (#{guesses} guesses left)" if guesses >= 2
			puts "Try again! (1 guess left)" if guesses == 1
			puts "You lose." if guesses == 0
		end

		def evaluate
			guess = @guess.split('')
			answer = @answer.split('')
			correctAll = 0
			correctColor = 0
			leftovers = []

			i = 0
			guess.each do |a|
				a == answer[i] ? correctAll += 1 : leftovers << a
				i += 1
			end

			leftovers.each do |x|
				answer.each do |a|
					if x == a
						correctColor += 1
						next
					end
				end
			end

			puts "#{correctAll} correct colors in the right place. #{correctColor} correct colors found."
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