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
	end
end

#my_each
# a = [1,2,3,4]
# a.my_each {|num| puts num}
# b = ["Hello","Ni Hao","Salut","Hola"]
# b.my_each {|word| puts word + " =)"}

#my_each_with_index
c = ["Hello","Ni Hao","Salut","Hola"]
c.my_each_with_index {|word, i| puts "#{i}. #{word}!"}
