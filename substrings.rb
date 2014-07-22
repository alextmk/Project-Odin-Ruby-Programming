dictionary =["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(str,dictionary)
	word_arr=str.split(" ")
	hash=Hash.new(0)
	word_arr.each do |i|
		dictionary.each do |j|
			if(i.downcase.include?(j.downcase))
				hash[j]+=1
			end
		end
	end
	return hash
end

print substrings("Howdy partner, sit down! How's it going?", dictionary)