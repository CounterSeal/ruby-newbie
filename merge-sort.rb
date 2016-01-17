# Recursive merge-sort

def merge_sort(array)
	return array if array.size < 2
	half = array.size / 2
	first = merge_sort(array[0...half])
	second = merge_sort(array[half..-1])
	result = []

	while (first.size > 0) && (second.size > 0)
		result << (first[0] < second[0] ? first.shift : second.shift)
	end
	result += first if first.size > 0
	result += second if second.size > 0
	result
end


problem = Array.new(rand(1..20)) { rand(1..1000) }

puts "Input: " + problem.to_s
puts "Output: " + merge_sort(problem).to_s
#puts merge_sort([54, 71, 2, 98, 402, 18, 26, 84, 8, 242]).to_s
