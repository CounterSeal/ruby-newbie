# Hangman

module Hangman
	class Game
		attr_accessor :game, :answer, :board, :guess
		def initialize
			@game = game
			@answer = answer
			@board = board
			@guess = guess
		end

		def start
			puts "Welcome to Hangman!"
			@answer = word.downcase
			@board = create_board
			puts "Answer: #{@answer}"
			puts @board.join
			play
		end

		private

		def play
			puts "Take your guess!"
			guesses_left = 5
			6.times do
				@guess = gets.chomp.downcase
				if @guess == @answer
					puts "Correct. You win!"
					break
				end

				guess_process(@guess)
				puts @board.join
				puts "#{guesses_left} guesses remaining."
				guesses_left -= 1
			end

		end

		def guess_process(player_guess)
			if @answer.include?(player_guess)
				@answer.split('').each_with_index do |letter, index|
					if letter == player_guess
						@board[index] = letter
					end
				end
			else
				puts "Try Again!"
			end
		end

		def word
			lines = File.readlines('5desk.txt')
			lines[rand(lines.length)].chomp
		end

		def create_board
			board = '-' * @answer.length
			board.split('')
		end
	end
end

g = Hangman::Game.new
g.start