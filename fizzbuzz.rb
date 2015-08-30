# FizzBuzz

def fizzbuzz
	puts "Enter a positive, whole number to engage FizzBuzz! =)"
	num = gets.chomp.to_i
	
	1.upto(num) do |i|
	
		if (i % 3 == 0) && (i % 5 == 0)
			print "FizzBuzz "
		elsif (i % 3 == 0)
			print "Fizz "
		elsif (i % 5 == 0)
			print "Buzz "
		else
			print i.to_s + " "
		end
	end
end

fizzbuzz
