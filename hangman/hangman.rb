# Hangman

require 'open-uri'

module Hangman
	class Game
		attr_accessor :game, :answer, :board, :guess, :guessed, :guesses_left, :visual
		def initialize
			@game = game
			@answer = answer
			@board = board
			@guess = guess
			@guessed = []
			@guesses_left = 6
			@visual = ["____", "|  |", "|", "|", "|"]
		end

		def start
			puts "Welcome to Hangman!"
			puts "Enter \"-save\" at any time during the game to save your progress."

			while true
				puts "Would you like to (1) Start a new game or (2) Load your last saved game?"
				choice = gets.chomp

				case choice
				when "1"
					@answer = word.downcase
					@board = create_board
					#puts "[Debug] Answer: #{@answer}"
					visual_board
					puts @board.join
					play
					break
				when "2"
					load_save
					@answer
					@board
					#puts "[Debug] Answer: #{@answer}"
					visual_board
					puts @board.join
					puts "#{guesses_left} guesses remaining."
					puts "Incorrect guesses: #{@guessed.join(', ')}"
					play
					break
				else
					puts "Please enter 1 or 2."
				end
			end
		end

		private

		def play
			puts "Take your guess!"
			puts "\n"
			while @guesses_left > 0
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
						visual_board
						puts "You lose!"
						puts "The correct word was \"#{@answer}\"."
						exit
					else
						visual_board
						puts @board.join
						puts "#{guesses_left} guesses remaining."
						puts "Incorrect guesses: #{@guessed.join(', ')}"
						puts "\n"
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
				@guesses_left -= 1
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

		def load_save
			contents = File.open("save_game.txt", "r").readlines

			@answer = contents[0].chomp
			@board = contents[1].chomp.split('')
			@guesses_left = contents[2].chomp.to_i
			@visual = contents[3].split('-')
			@guessed = contents[4].chomp.split('') unless contents[3].chomp.empty?
		end

		def save
			saved_data = [@answer, @board.join, @guesses_left + 1, @visual.join('-'), @guessed.join]
			File.open("save_game.txt", "w"){ |line| line.puts(saved_data) }
			puts "Game saved!"
			puts "\n"
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

		def visual_board
			case @guesses_left
			when 6
				puts @visual
			when 5
				@visual[2] = "|  O"
				puts @visual
			when 4
				@visual[3] = "|  |"
				puts @visual
			when 3
				@visual[3] = "| /|"
				puts @visual
			when 2
				@visual[3] = "| /|\\"
				puts @visual
			when 1
				@visual[4] = "| /"
				puts @visual
			when 0
				@visual[4] = "| / \\"
				puts @visual
			end
		end
	end
end

g = Hangman::Game.new
g.start
