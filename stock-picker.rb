# Stock Picker

def stock_picker(prices)
	largestDiff = 0
	buySell = []

	prices.each do |i|
		prices.each_with_index do |price, x|
			if ((prices[x+1] - i) > largestDiff)
				largestDiff = prices[x+1] - i
				buySell = [i,x+1]
			end
		end
	end

	puts buySell
end


stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([6,10,3,1,10,4])