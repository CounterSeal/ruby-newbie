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
		return self unless block_given?
		switch = true
		for i in self
			switch = false if yield(i) == (false || nil)
		end

		p switch
	end
end

a = [1,2,3,4,5,6,7]
b = ["Hello","Ni Hao","Salut","Hola"]

#my_each
# a.my_each {|num| puts num}
# b.my_each {|word| puts word + " =)"}

#my_each_with_index
# b.my_each_with_index {|word, i| puts "#{i}. #{word}!"}

#my_select
# puts a.my_select {|num| num % 2 == 0}
# puts b.my_select {|word| word[0].downcase == "h"}

#my_all?
a.my_all? {|num| num < 10}
b.my_all? {|word| word.length >= 4}
b.my_all? {|word| word.length < 5}
