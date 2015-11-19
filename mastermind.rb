# Mastermind
# Mastermind is a game where you have to guess your opponent's secret code within a certain number
# of turns (like hangman with colored pegs). Each turn you get some feedback about how good your
# guess was -- whether it was exactly correct or just the correct color but in the wrong space.

#require 'colorize'

module Mastermind
	class Game
		attr_reader :game
		def initialize
			@game = game
		end

		def start
			puts "Welcome to MASTERMIND. Let's begin!"

			while true
				puts "Would you like to be the (1)Code Breaker or the (2)Code Maker?"
				choice = gets.chomp.downcase
				if choice == "1"
					play_breaker
					break
				elsif choice == "2"
					play_maker
				else
					puts "Enter 1 or 2"
				end
			end
		end

		def quit
			puts "Goodbye!"
			exit
		end

		def play_breaker
			player = Player.new
			board = Board.new
			board.breaker_mode
		end

		def play_maker
			player = Player.new
			board = Board.new
			board.maker_mode
		end
	end

	class Board
		attr_accessor :answer, :guess, :correct_all_colors
		def initialize
			@answer = answer
			@guess = guess
			@correct_all_colors = [nil, nil, nil, nil]
		end

		def breaker_mode
			puts "Take your guess!"
			solution
			guesses = 11
			12.times do
				@guess = gets.chomp.downcase
				if @guess == @answer
					puts "You win!"
					puts "Play again? Y/N"
					play_again
					break
				end

				evaluate
				feedback(guesses)
				puts "\n"
				guesses -= 1
			end
		end

		def maker_mode
			puts "Choose a combination of 4 colors:"
			@answer = gets.chomp.downcase
			guesses = 11
			12.times do
				@guess = ai_guess(@correct_all_colors)
				puts @guess
				if @guess == @answer
					puts "The computer has won!"
					puts "Play again? Y/N"
					play_again
					break
				end

				evaluate
				feedback(guesses)
				puts "Next? (Press Enter or Return)"
				next if gets.chomp.downcase == "\n"
				guesses -= 1
			end
		end

		private

		def solution
			@answer = 4.times.map { ['b', 'g', 'c', 'p', 'r', 'y'].sample }.join
			#@answer = 'brby'
			#@answer = 'rycc'
		end

		def feedback(guesses)
			case guesses
			when 2..11
				puts "Try again! (#{guesses} guesses left)" if guesses >= 2
			when 1
				puts "Try again! (1 guess left)" if guesses == 1
			when 0
				puts "You lose. The correct combination was \"#{@answer}\". Play again? Y/N" if guesses == 0
				play_again
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
					@correct_all_colors[index] = a
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

		def play_again
			new_game = Mastermind::Game.new
			choice = gets.chomp.downcase
			choice == "y" ? new_game.start : new_game.quit
		end

		def ai_guess(correct_all)
			colors = ['b', 'g', 'c', 'p', 'r', 'y']
			guess = []
			choosing = Random.new
			4.times do |x|
				if correct_all[x] == nil
					guess << colors[choosing.rand(5)]
				else
					guess << correct_all[x]
				end
			end

			guess.join('')
		end
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
