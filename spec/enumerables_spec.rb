# Enumerable Methods (Rspec)

require 'spec_helper'

describe Enumerable do
	before do
		@a = [1,2,3,4,5,6,7]
		@b = ["Hello","Ni Hao","Salut","Hola"]
		@c = [nil, false, nil, nil, 5]
		@d = []
	end

	describe "#my_each" do
		it "should return self if no block given" do
			expect(@a.my_each).to eq(@a)
		end

		it "should return self on an empty array" do
			expect(@d.my_each).to eq(@d)
		end
	end

	describe "#my_map" do
		it "should run the block" do
			expect(@a.my_map { |n| n * 2}).to eq([2,4,6,8,10,12,14])
		end

		it "should return self on an empty array" do
			expect(@d.my_map { |j| j }).to eq([])
		end
	end

	describe "#my_select" do
		it "should select the correct items" do
			expect(@c.my_select { |j| j != nil }).to eq([false, 5])
		end
	end

	describe "#my_any?" do
		it "should return true" do
			expect(@b.my_any? { |j| j.length > 3 }).to eq(true)
		end
	end

	describe "#my_count" do
		it "should return the number of o total objects in the array" do
			expect(@b.my_count).to eq(4)
		end

		it "should return the count of the specified object in the array" do
			expect(@a.my_count(6)).to eq(1)
		end
	end

	describe "#my_map" do
		it "should run the given block" do
			result = ["Hello, good sir!","Ni Hao, good sir!","Salut, good sir!","Hola, good sir!"]
			expect(@b.my_map { |j| j + ", good sir!"} ).to eq(result)
		end

		it "should return the original array" do
			expect(@c.my_map { |j| j }).to eq(@c)
		end
	end
end
