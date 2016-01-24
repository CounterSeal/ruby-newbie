# Binary Tree

class Node
	attr_accessor :value, :left, :right
	def initialize(value)
		@value = value
	end

	def insert(n)
		case value <=> n
		when 1 then left.insert(n)
		when -1 then right.insert(n)
		when 0 then false
		end
	end
end

def build_tree(array)

end

