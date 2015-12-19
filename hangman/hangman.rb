# Hangman

require 'open-uri'

module Hangman
	class Game
		attr_accessor :game, :answer, :board, :guess, :guessed, :guesses_left
		def initialize
			@game = game
			@answer = answer
			@board = board
			@guess = guess
			@guessed = []
			@guesses_left = 5
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
			6.times do
				@guess = gets.chomp.downcase
				commands
				if @guess == @answer
					puts "Correct. You win!"
					exit
				else
					guess_process(@guess)
					if @board.join == @answer
						puts @board.join
						puts "Correct. You win!"
						exit
					elsif @guesses_left == 0
						puts "You lose!"
					else
						puts @board.join
						puts "#{guesses_left} guesses remaining."
						puts "Incorrect guesses: #{@guessed.join(', ')}"
						puts "\n"
						@guesses_left -= 1
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
			end
		end

		def commands
			command_list = ["-define", "-save"]
			while command_list.include?(@guess)
				case @guess
				when "-define"
					define
					@guess = gets.chomp.downcase
				when "-save"
					save
					@guess = gets.chomp.downcase
				end
			end
		end

		def save
			saved_data = { answer: @answer, board: @board, guesses_left: @guesses_left + 1, guessed: @guessed }
			save_file = File.open("save_game.txt", "w")
			save_file.puts saved_data.to_s
			save_file.close
		end

		def define
			url = 'http://dictionary.reference.com/browse/' + @answer
			#puts open(url).read.match(/<span class="def-number">1[^:]*/m)
			puts open(url).read.match(/<span class="def-number">1(.*)"def-number">2/m)
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
