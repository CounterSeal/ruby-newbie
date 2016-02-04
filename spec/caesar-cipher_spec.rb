# Caesar Cipher (Rspec):
# Implement a caesar cipher that takes in a string and the shift factor
# and then outputs the modified string

require 'spec_helper'

describe '#caesarSalad' do
	before :all do
		@input = "I like Caesar Salad."
		@result = caesarSalad(@input, 4)
	end

	it "should return a string" do
		expect(@result.class).to eq(String)
	end

	it "should be the same length as the input text" do
		expect(@result.size).to eq(@input.size)
	end

	it "should shift by a positive number" do
		expect(caesarSalad("test", 3)).to eq("whvw")
	end

	it "should shift by a negative number" do
		expect(caesarSalad("test", -3)).to eq("qbpq")
	end

	it "should shift past the end of the alphabet" do
		expect(caesarSalad("xzway", 6)).to eq("dfcge")
	end

	it "should handle spaces" do
		expect(caesarSalad("ayy lmao", 4)).to eq("ecc pqes")
	end
end
