# Roman numerals (Old school)

# Long way
def old_roman_numeral num
	value = num.to_i
	result = []
	
	while value > 0
		if (value >= 1000) && (value <= 4999)
			result.push "M"
			value -= 1000
		elsif (value >= 500) && (value <= 999)
			result.push "D"
			value -= 500
		elsif (value >= 100) && (value <= 499)
			result.push "C"
			value -= 100
		elsif (value >= 50) && (value <= 99)
			result.push "L"
			value -= 50
		elsif (value >= 10) && (value <= 49)
			result.push "X"
			value -= 10
		elsif (value >= 5) && (value <= 9)
			result.push "V"
			value -= 5
		elsif (value >= 1) && (value <= 4)
			result.push "I"
			value -= 1
		end
	end
	
	puts "The Old-School Roman numeral of #{num} is " + result.join
end

# DRY Way
def dry_old_roman_numeral num
	value = num.to_i
	numbers = [1000, 500, 100, 50, 10, 5, 1]
	roman_numerals = ["M", "D", "C", "L", "X", "V", "I"]
	result = ""
	
	numbers.length.times do |i|
		while value >= numbers[i]
			value -= numbers[i]
			result += roman_numerals[i]
		end
	end
	
	puts "The Old-School Roman numeral of #{num} is " + result
end

# Roman Numerals (Modern)

def roman_numeral num
	value = num.to_i
	numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
	roman_numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
	result = ""
	
	numbers.length.times do |i|
		while value >= numbers[i]
			value -= numbers[i]
			result += roman_numerals[i]
		end
	end
	
	puts "The Roman numeral of #{num} is " + result
end

roman_numeral 4999
