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
		context "with array" do
			it "should return self if no block given" do
				expect(@a.my_each).to eq(@a)
			end
		end
	end

	describe "#my_map" do
		it "should run the block" do
			expect(@a.my_map { |n| n * 2}).to eq([2,4,6,8,10,12,14])
		end
	end
end
