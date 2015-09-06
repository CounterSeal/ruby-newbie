# Substrings:
# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive) that was
# found in the original string and how many times it was found.

def substrings(words, dictionary)
	wordList = words.downcase.split(/\W+/)
	result = {}

	dictionary.each do |a|
		count = 0
		wordList.each do |b|
			count += 1 if (b.include? a)
		end

		result[a] = count unless (count == 0)
	end

	(result.empty?) ? (puts "There are no matches!") : (puts result)
	puts "\n"
end


myDictionary = ["below","down","go","going","horn","how","howdy",
	"it","i","low","own","part","partner","sit"]
myOtherDict = ["ate","play","no","notice","i","hall","gate",
	"art","part","senpai","iron","wait","partner","sat"]

substrings("below", myDictionary)
substrings("Howdy partner, sit down! How's it going?", myDictionary)
substrings("Notice me, Senpai! I am awaited by the gates of Valhalla!", myOtherDict)
substrings("Play.", myOtherDict)
substrings("There be no spoon!!", myDictionary) #Should result in empty hash
