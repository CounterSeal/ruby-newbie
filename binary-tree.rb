# Binary Tree

class Node
	attr_accessor :value, :left, :right

	def initialize(value)
		@value = value
	end

=begin #Alternate Method
	def insert(new_node)
		if new_node < @value
			left.nil? ? self.left = Node.new(new_node) : left.insert(new_node)
		else
			right.nil? ? self.right = Node.new(new_node) : right.insert(new_node)
		end
	end
=end

	def insert(n)
		case @value <=> n
		when 1 then insert_left(n)
		when -1 then insert_right(n)
		when 0 then false
		end
	end

	private

	def insert_left(n)
		left ? (left.insert(n)) : (self.left = Node.new(n))
	end

	def insert_right(n)
		right ? (right.insert(n)) : (self.right = Node.new(n))
	end
end

def build_tree(array)
	array.shuffle!
	root = Node.new(array.shift)
	array.each { |n| root.insert(n) }
	root
end

def breadth_first_search(n, current_node)
	queue = [current_node]
	puts "[BFS] Searching for #{n}..."
	until queue.empty?
		current = queue.first.value
		return "#{n} was found in #{queue.first}." if current == n
		queue << queue.first.left unless queue.first.left.nil?
		queue << queue.first.right unless queue.first.right.nil?
		queue.shift
	end
	puts "#{n} was not found in the tree."
end

def depth_first_search(n, current_node)
	stack = [current_node]
	checked = [current_node]
	puts "[DFS] Searching for #{n}..."
	until stack.empty?
		current = stack.last.value
		return "#{n} was found in #{stack.last}." if current == n
		if stack.last.left && !checked.include?(stack.last.left)
			stack << stack.last.left
			checked << stack.last
		elsif stack.last.right && !checked.include?(stack.last.right)
			stack << stack.last.right
			checked << stack.last
		else
			stack.pop
		end
	end
		puts "#{n} was not found in the tree."
end

def dfs_rec(n, current_node)
	puts "[DFS_Rec] Searching for #{n}..."
	return "#{n} was found in #{current_node}." if current_node.value == n
	left_search = dfs_rec(n, current_node.left) unless current_node.left.nil?
	return left_search unless left_search.nil?
	right_search = dfs_rec(n, current_node.right) unless current_node.right.nil?
	return right_search unless right_search.nil?
end


binary_tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts breadth_first_search(4, binary_tree) + "\n\n"
puts depth_first_search(9, binary_tree) + "\n\n"
puts dfs_rec(7, binary_tree)
