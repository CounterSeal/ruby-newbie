# Advent of Code
# http://adventofcode.com/
# Day 2

# Part One
def total_paper(dimensions)
	sides = dimensions.split("x").map { |n| n.to_i }
	length, width, height = sides[0], sides[1], sides[2]
	a, b, c = (length * width), (width * height), (height * length)
	min_area = [a, b, c].min
	result = (2 * a) + (2 * b) + (2 * c) + min_area
end

def total_paper_multi(file)
	puzzle = File.open(file, "r")
	total = 0
	puzzle.readlines.each do |line|
		total += total_paper(line)
	end
	total
end

# Part Two
def total_ribbon(dimensions)
	sides = dimensions.split("x").map { |n| n.to_i }.sort
	a = (2 * sides[0]) + (2 * sides[1])
	b = sides[0] * sides[1] * sides[2]
	result = a + b
end

def total_ribbon_multi(file)
	puzzle = File.open(file, "r")
	total = 0
	puzzle.readlines.each do |line|
		total += total_ribbon(line)
	end
	total
end


#puts total_paper("2x3x4")
#puts total_paper("1x1x10")
puts "Total wrapping paper needed: #{total_paper_multi("day-02-puzzle.txt")} square feet."

#puts total_ribbon("2x3x4")
#puts total_ribbon("1x1x10")
puts "Total ribbon needed: #{total_ribbon_multi("day-02-puzzle.txt")} feet."
