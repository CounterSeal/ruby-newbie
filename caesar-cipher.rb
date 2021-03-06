# Caesar Cipher:
# Implement a caesar cipher that takes in a string and the shift factor
# and then outputs the modified string

def caesarSalad(text, num)
	alphabet = ('a'..'z').to_a
	textArr = text.split('')
	n = num.to_i
	newText = ''

	textArr.each do |w|
		if (alphabet.include?(w.downcase) == false)
			newText << w
		end

		alphabet.each_with_index do |letter, i|
			if (w.downcase == letter) && ((i+n) < alphabet.length)
				if (w == letter.upcase)
					newText << alphabet[i+n].upcase
				else
					newText << alphabet[i+n]
				end
			elsif (w.downcase == letter) && ((i+n) >= alphabet.length)
				a = (i+n) - (alphabet.length)
				if (w == letter.upcase)
					newText << alphabet[a].upcase
				else
					newText << alphabet[a]
				end
			end
		end
	end

	newText
end

# puts caesarSalad("I like Caesar Salad.", 4)
# puts caesarSalad("I am still a Ruby Newbie, but I am getting better!!", 3)
# puts caesarSalad("If you're an animal, then TEAR UP THE FLOOR!", 7)