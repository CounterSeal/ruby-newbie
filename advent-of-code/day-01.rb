# Advent of Code
# http://adventofcode.com/
# Day 1

# Part One
def which_floor(directions)
	floor = 0
	directions.split('').each do |direction|
		case direction
		when "(" then floor += 1
		when ")" then floor -= 1
		end
	end
	floor
end

# Part Two
def enters_basement(directions)
	floor = 0
	count = 0
	directions.split('').each do |direction|
		case direction
		when "("
			floor += 1
			count += 1
		when ")"
			floor -= 1
			count += 1
		end
		return count if floor == -1
	end
end


puzzle = File.open("day-01-puzzle.txt", "r") { |file| file.read}
puts "Santa is taken to floor #{which_floor(puzzle)}."
puts "Santa enters the basement after #{enters_basement(puzzle)} positions."
