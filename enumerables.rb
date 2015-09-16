# Enumerable Methods

module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		return self unless block_given?
		for i in self
			yield(i,self.index(i))
		end
	end

	def my_select
		return self unless block_given?
		selected = []
		self.my_each {|i| selected << i if yield(i)}
		selected
	end

	def my_all?
		if block_given?
			for i in self
				return false if !(yield(i))
			end
		else
			for i in self
				return false if i == (nil || false)
			end
		end
		true
	end

	def my_any?
		if block_given?
			for i in self
				return true if yield(i)
			end
		else
			for i in self
				return true if i != (nil || false)
			end
		end
		false
	end

	def my_none?
		if block_given?
			for i in self
				return false if yield(i)
			end
		else
			for i in self
				return false if i != (nil || false)
			end
		end
		true
	end

end

a = [1,2,3,4,5,6,7]
b = ["Hello","Ni Hao","Salut","Hola"]
c = [nil, false, nil, nil, 5]
d = []

# my_each
#a.my_each {|n| puts n}
#b.my_each {|word| puts word + " =)"}

# my_each_with_index
#b.my_each_with_index {|word, i| puts "#{i}. #{word}!"}

# my_select
#puts a.my_select {|n| n % 2 == 0}
#puts b.my_select {|word| word[0].downcase == "h"}

# my_all?
#puts a.my_all? {|n| n < 8} #true
#puts b.my_all? {|word| word.length >= 4} #true
#puts d.my_all? #true
#puts d.my_all? {|n| n < 2} #true
#puts b.my_all? {|word| word.length < 5} #false
#puts c.my_all? #false

# my_any?
#puts a.my_any? {|n| n > 6} #true
#puts b.my_any? {|word| word[-1].downcase == "a"} #true
#puts c.my_any? #true
#puts b.my_any? {|word| word.length >= 7} #false
#puts d.my_any? #false
#puts d.my_any? {|n| n < 2} #false

# my_none?
puts a.my_none? {|n| n > 8} #true
puts b.my_none? {|word| word.length <= 3} #true
puts d.my_none? #true
puts d.my_none? {|n| n < 2} #true
puts b.my_none? {|word| word[0] == "S"} #false
puts c.my_none? #false