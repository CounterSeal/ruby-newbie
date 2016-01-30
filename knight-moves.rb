# Knight Moves

class Board
	attr_accessor :x, :y

	def initialize(x, y)
		@x = x
		@y = y
	end
end

class Knight
	attr_accessor :space, :from, :moves

	def initialize(space = nil, from = nil)
		@space = space
		@from = from
	end
end

def moves_maker(start_point)
	moves = [[-2,-1],[-2,1],[2, 1],[2,-1],[-1,-2],[-1,2],[1,2],[1,-2]]
	allowed = []
	moves.each {|x, y| allowed << [start_point[0] + x, start_point[1] + y] }
	allowed.reject! { |x, y| (x > 7) || (x < 0) || (y > 7) || (y < 0) }
	allowed
end

def knight_moves(start_point, end_point)
	knight = Knight.new(start_point)
	queue = []
	checked = [start_point]
	result = []
	until knight.space == end_point
		moves_maker(knight.space).each do |move|
			unless checked.include?(move)
				checked << knight
				queue << Knight.new(move, knight)
			end
		end
		knight = queue.shift
	end
	result << knight.space
	until knight.from.nil?
		result << knight.from.space
		knight = knight.from
	end
	puts "You made it in #{result.size - 1} moves! This was your path:"
	p result.reverse
end


knight_moves([0,0], [3,3])
knight_moves([3,3], [7,4])
