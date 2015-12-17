# Hangman

require 'open-uri'

module Hangman
	class Game
		attr_accessor :game, :answer, :board, :guess, :guessed
		def initialize
			@game = game
			@answer = answer
			@board = board
			@guess = guess
			@guessed = []
		end

		def start
			puts "Welcome to Hangman!"
			@answer = word.downcase
			@board = create_board
			puts "[Debug] Answer: #{@answer}"
			puts @board.join
			play
		end

		private

		def play
			puts "Take your guess!"
			guesses_left = 5
			6.times do
				@guess = gets.chomp.downcase

				while @guess == "-define"
					define
					@guess = gets.chomp.downcase
				end

				if @guess == @answer
					puts "Correct. You win!"
					exit
				else
					guess_process(@guess)
					if @board.join == @answer
						puts "Correct. You win!"
						exit
					else
						puts @board.join
						puts "#{guesses_left} guesses remaining."
						puts "Incorrect guesses: #{@guessed.join(', ')}"
						guesses_left -= 1
					end
				end
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
				@guessed << player_guess
				puts "Try Again!"
			end
		end

		def word
			lines = File.readlines('5desk.txt')
			lines[rand(lines.length)].chomp
		end

		def define
			url = 'http://dictionary.reference.com/browse/' + @answer
			puts open(url).readline
		end

		def create_board
			board = '-' * @answer.length
			board.split('')
		end
	end
end

g = Hangman::Game.new
g.start
