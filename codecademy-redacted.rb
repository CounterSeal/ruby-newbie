puts "Enter some words!"
text = gets.chomp

puts "Which words do you want to redact?"
redact = gets.chomp.downcase

words = text.split(" ")
redacted_words = redact.split(" ")

words.each do |word|
    target = false
    redacted_words.each do |to_redact|
        if word.downcase == to_redact
            target = true
        end
    end
    
    if target == true
        print "REDACTED "
    else
        print word + " "
    end
end
