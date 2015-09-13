# Bubble Sort:
# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn't it?).

# Bubble Sort By:
# Now create a similar method called #bubble_sort_by which sorts an array but accepts a block.
# The block should take two arguments which represent the two elements currently being compared.
# Expect that the block's return will be similar to the spaceship operator you learned about before --
# if the result of the block is negative, the element on the left is "smaller" than the element
# on the right. 0 means they are equal. A positive result means the left element is greater.
# Use this to sort your array.

def bubble_sort(nums)
	swapped = true

	while swapped
		swapped = false
		for i in (0...nums.size - 1)
			if (nums[i] > nums[i+1])
				nums[i], nums[i+1] = nums[i+1], nums[i]
				swapped = true
			end
		end
	end

	p nums
end

bubble_sort([4,3,78,2,0,2]) #[0,2,2,3,4,78]
bubble_sort([4,7,10,15,11,4]) #[4,4,7,10,11,15]
bubble_sort([4,8,4]) #[4,4,8]
bubble_sort([99,71]) #[71,99]
bubble_sort([8,17]) #[8,17]
bubble_sort([2]) #[2]
bubble_sort([100,65,44,21,19,18,12,7,3]) #[3,7,12,18,19,21,44,65,100]


def bubble_sort_by(sortThis)
	swapped = true

	while swapped
		swapped = false
		for i in (0...sortThis.size - 1)
			y = yield(sortThis[i], sortThis[i+1])
			if (y >= 1)
				sortThis[i], sortThis[i+1] = sortThis[i+1], sortThis[i]
				swapped = true
			end
		end
	end

	p sortThis
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end #["hi", "hey", "hello"]

bubble_sort_by([4,3,78,2,0,2]) do |left,right|
	left - right
end #[0,2,2,3,4,78]

bubble_sort_by([4,7,10,15,11,4]) do |left,right|
	left - right
end #[4,4,7,10,11,15]

bubble_sort_by([4,8,4]) do |left,right|
	left - right
end #[4,4,8]

bubble_sort_by([99,71]) do |left,right|
	left - right
end #[71,99]

bubble_sort_by([8,17]) do |left,right|
	left - right
end #[8,17]

bubble_sort_by([2]) do |left,right|
	left - right
end #[2]

bubble_sort_by([100,65,44,21,19,18,12,7,3]) do |left,right|
	left - right
end #[3,7,12,18,19,21,44,65,100]
