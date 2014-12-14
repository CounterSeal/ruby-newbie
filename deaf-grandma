# Deaf Grandma

def deafgrandma
	puts "Say something to grandma!"
	bye_count = 0
	
	while true
		input = gets.chomp
		
		if input == "BYE"
			bye_count += 1
			
			if bye_count == 3
				puts "Grandma says: GOODBYE! SEE YOU AGAIN SOON, CHILD!"
				break
			end
			
			puts "(Grandma didn't seem to hear you...)"
		elsif input != input.upcase
			puts "Grandma says: HUH?! SPEAK UP, CHILD!"
			bye_count = 0
		elsif input == input.upcase
			puts "Grandma says: NO, NOT SINCE 19#{rand(21) + 30}!"
			bye_count = 0
		end
	end
end

deafgrandma
