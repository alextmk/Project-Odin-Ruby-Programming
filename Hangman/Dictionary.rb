class Dictionary
	def initialize(min,max)
		@words=open_file("./5desk.txt")
		@select_words_min_max=@words.select do |i|
			i.length>=min&&i.length<=max
		end
	end

	def get_a_word
		return @select_words_min_max[get_random]
	end

	private

		def get_random #returns randomly a number between 0 and select_words.length-1
			return rand(@select_words_min_max.length-1)
		end
		def open_file(filename) #returns the array containing all the words
			file=File.open(filename, "r")
			word_arr=[]
			file.each_line do |line|
				word_arr<<line.strip
			end
			return word_arr
		end
end