# Substrings:
# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive) that was
# found in the original string and how many times it was found.

def substrings(words, dictionary)
	wordList = words.downcase.split(/\W+/)
	result = Hash.new

	wordList.each do |a|
		dictionary.each do |b|
			if a.include? b
				result[a] = 1
			end
		end
	end

	result
end


myDictionary = ["below","down","go","going","horn","how","howdy",
	"it","i","low","own","part","partner","sit"]

substrings("below", myDictionary)
substrings("Howdy partner, sit down! How's it going?", myDictionary)
