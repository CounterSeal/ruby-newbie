# Advent of Code
# http://adventofcode.com/
# Day 3

# Part One
def present_houses(instructions)
	count = 1
	grid = [[1]]
	y, x = 0, 0

	instructions.split('').each do |direction|
		case direction
		when "^"
			if y == 0
				grid_width = grid.max_by { |row| row.length }.length
				new_row = Array.new(grid_width)
				new_row[x] = 1
				grid.unshift(new_row)
				count += 1
			else
				if grid[y-1][x] == nil
					grid[y-1][x] = 1
					count += 1
					y -= 1
				else
					grid[y-1][x] += 1
					y -= 1
				end
			end
		when ">"
			if grid[y][x+1] == nil
				grid[y][x+1] = 1
				count += 1
				x += 1
			else
				grid[y][x+1] += 1
				x += 1
			end
		when "v"
			if y == grid.length-1
				grid_width = grid.max_by { |row| row.length }.length
				new_row = Array.new(grid_width)
				new_row[x] = 1
				grid << new_row
				count += 1
				y += 1
			else
				if grid[y+1][x] == nil
					grid[y+1][x] = 1
					count += 1
					y += 1
				else
					grid[y+1][x] += 1
					y += 1
				end
			end
		when "<"
			if x == 0
				grid.each { |row| row.unshift(nil) }
				grid[y][x] = 1
				count += 1
			else
				if grid[y][x-1] == nil
					grid[y][x-1] = 1
					count += 1
					x -= 1
				else
					grid[y][x-1] += 1
					x -= 1
				end
			end
		end
	end

	count
	#puts count
	#grid.each { | line| puts line.to_s }
end

# Part Two



puzzle = File.open("day-03-puzzle.txt", "r") { |file| file.read }

puts present_houses(puzzle)
