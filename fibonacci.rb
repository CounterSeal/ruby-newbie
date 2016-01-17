# Fibonacci

def fibs(n)
	result = [0]
	n >= 1 ? (result << 1) : (return result)
	(n - 1).times do |i|
		result << result[i] + result[i + 1]
	end
	result
end

def fibs_rec(n)
	return [0] if n == 0
  return [0, 1] if n == 1
	fibs_rec(n - 1) << fibs_rec(n - 1)[-1] + fibs_rec(n - 1)[-2]
end


#puts fibs(3).to_s
puts fibs_rec(4).to_s
