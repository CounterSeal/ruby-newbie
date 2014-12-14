# Leap Years

def leapyears
	puts "Enter a starting year:"
	y1 = gets.chomp.to_i
	puts "Enter an ending year:"
	y2 = gets.chomp.to_i
	puts "----"
	
	y1.upto(y2) do |i|
		if (i % 4 == 0) && !(i % 100 == 0)
			puts i
		elsif i % 400 == 0
			puts i
		end
	end
end

leapyears
