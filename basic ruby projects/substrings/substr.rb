=begin 
Implement a method #substrings that takes a word as the first argument and then an array of valid substrings
(your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) 
that was found in the original string and how many times it was found. 
=end

def substrings(word, dictionary)
    substrings_count = Hash.new(0)
    dictionary.each do |el|
        substring = word.match(el)
        substrings_count[el] += 1 if substring
    end
    substrings_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary) # { "below" => 1, "low" => 1 }
p substrings("Howdy partner, sit down! How's it going?", dictionary)