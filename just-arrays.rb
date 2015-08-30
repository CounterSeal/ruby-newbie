# Arrays

def sorted_array
	puts "Type and enter things, anything in as many lines as you want. Go for it!"
	list = []
	
	while true
		user_input = gets.chomp.to_s
		list.push user_input
		
		if user_input == ""
			break
		end
	end
	
	puts list.sort
	
end

sorted_array
