# Stock Picker
# Implement a method #stock_picker that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days representing
# the best day to buy and the best day to sell. Days start at 0.

def stock_picker(prices)
	largestDiff = 0
	buyDay = 0
	sellDay = 0

	prices.each_with_index do |firstPrice, i|
		prices.each_with_index do |secondPrice, x|
      next if (i >= x)
			diff = (secondPrice - firstPrice)
			if (diff > largestDiff)
				largestDiff = diff
				buyDay = i
				sellDay = x
			end
		end
	end

	buyAt = prices[buyDay]
	sellAt = prices[sellDay]

	if largestDiff > 0
		p [buyDay,sellDay]
		puts "Buy on Day #{buyDay} at $#{buyAt} and sell on Day #{sellDay} at $#{sellAt} for a $#{largestDiff} profit!"
		puts "\n"
	else
		puts "Do not buy stock! There is no profit to be made."
		puts "\n"
	end
end


stock_picker([17,3,6,9,15,8,6,1,10]) #[1,4]
stock_picker([6,10,3,1,10,4]) #[3,4]
stock_picker([2,7,1,2,8,11,3]) #[2,5]

stock_picker([7,4,8,11,2]) #[1,3]
stock_picker([10,4,8,2,5]) #[1,2]

stock_picker([14,3,5,9,1]) #[1,3]
stock_picker([3,4,8,5,20]) #[0,4]

stock_picker([50,50,50,50]) #Do not buy.
stock_picker([6,5,4,3,2]) #Do not buy.
