# 99 Bottle of Beer

def bottles_of_beer(num)
	
	beer = num.to_i
	while beer >= 0
	
		if beer > 1
			puts "#{beer} bottles of beer on the wall, #{beer} bottles of beer."
			
			if beer == 2
				puts "Take one down and pass it around, #{beer - 1} bottle of beer on the wall."
			else
				puts "Take one down and pass it around, #{beer - 1} bottles of beer on the wall."
			end
			
			puts ""
		elsif beer == 1
			puts "1 bottle of beer on the wall, 1 bottle of beer."
			puts "Take one down and pass it around, no more bottles of beer on the wall."
			puts ""
		else
			puts "No more bottles of beer on the wall, no more bottles of beer."
			puts "Go to the store and buy some more, #{num} bottles of beer on the wall."
		end
		
		beer -= 1
	end
end

bottles_of_beer(99)
