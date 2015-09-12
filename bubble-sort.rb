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
	swapCount = 0

	nums.map_with_index do |number, i|
		next if (i + 1 == nums.size)
		if (number > nums[i+1])
			number, nums[i+1] == nums[i+1], number
			swapCount += 1
		end
	end
end


bubble_sort([4,3,78,2,0,2]) #[0,2,2,3,4,78]
