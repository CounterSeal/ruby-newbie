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

	def my_count(n = nil)
		counter = 0
		if block_given?
			for i in self
				counter += 1 if yield(i)
			end
		elsif n.nil?
			for i in self
				counter += 1
			end
		else
			for i in self
				counter += 1 if (i == n)
			end
		end
		counter
	end

	def my_map(p = nil)
		result = []
		if p && block_given?
			for i in self
				result << p.call(yield(i))
			end
		elsif p
			for i in self
				result << p.call(i)
			end
		elsif block_given?
			for i in self
				result << yield(i)
			end
		else
			result = self.to_enum(:my_map)
		end
		result
	end

	def my_inject(n = nil)
		if n.nil?
			result = self[0]
			for i in self[1..(self.size)]
				result = yield(result,i)
			end
		else
			result = n
			for i in self[0..(self.size)]
				result = yield(result,i)
			end
		end
		result
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
#p a.my_select {|n| n % 2 == 0}
#p b.my_select {|word| word[0].downcase == "h"}

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
#puts a.my_none? {|n| n > 8} #true
#puts b.my_none? {|word| word.length <= 3} #true
#puts d.my_none? #true
#puts d.my_none? {|n| n < 2} #true
#puts b.my_none? {|word| word[0] == "S"} #false
#puts c.my_none? #false

# my_count
#puts a.my_count #7
#puts b.my_count #4
#puts c.my_count #5
#puts d.my_count #0
#puts a.my_count(5) #1
#puts a.my_count {|n| n%3 == 0} #2

# my_map
#p a.my_map {|n| n*2} #[2,4,6,8,10,12,14]
#p b.my_map #enum
#p b.my_map {|x| x + ", Replicant!"} #["Hello, Replicant!","Ni Hao, Replicant!","Salut, Replicant!","Hola, Replicant!"]
#p c.my_map {"doge"} #["doge", "doge", "doge", "doge", "doge"]
#p d.map #enum
testProc = Proc.new {|n| n*2}
p a.my_map(testProc) #[2,4,6,8,10,12,14]

# my_inject
#puts a.my_inject(3) {|sum, n| sum + n} #28
#puts a.my_inject {|product, n| product * n} #5040
#puts a.my_inject(2) {|product, n| product * n} #10080
#puts b.my_inject {|memo, word| memo.length > word.length ? memo : word} #Ni Hao
