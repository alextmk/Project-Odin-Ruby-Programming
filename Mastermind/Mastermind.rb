class Mastermind

	def initialize(slots,rows) #takes in how many slots and how many rows, 
		@slots=slots
		@row=0 #keeps track of guess #, stops at rows-1
		@row_limit=rows
		@answer=[] #answer array
		@player_answer=nil #array holding guess
		@guesses_so_far=[]

	end

	def populate(choice=0) #choice takes 0 or 1, 0 for computer answre, 1 for your input
		if(choice==1)
			puts "Enter your secret code by typing 4 digits each ranging from 0-5"
			@answer=gets.chomp.split("").map {|i| i.to_i}
		else
			@slots.times do |i| #insert randomly 0-5 into answer
				@answer<<rand(6)
			end
			
		end
	end

	def welcome_message
		print "Welcome to the Mastermind! Start guessing by typing 4 digits each ranging from 0-5"
		puts ""
	end

	def feed_back #must give feedback
		print "You have #{check_position} correct numbers in correct position"
		puts ""
		print "You have #{check_colors} correct numbers in wrong position"
		puts ""
	end

	def take_guess #takes a user guess, need to add checking, right now assumes correct user input
		puts "-----------------------------------------------------------------------------"
		print "Take a guess by typing 4 digits each ranging from 0-5, this is round ##{@row+1}"
		puts ""
		@player_answer=gets.chomp.split("").map {|i| i.to_i}

		if(@guesses_so_far.include?(@player_answer))
			while(@guesses_so_far.include?(@player_answer))
				print "Sorry you've already guessed that, enter another guess please. you're currently on round ##{@row+1}"
				puts ""
				@player_answer=gets.chomp.split("").map {|i| i.to_i}
			end
		end

		@guesses_so_far<<@player_answer
		@row+=1
	end

  def check_colors #check how many colors (numbers you have right)
		#go through player_answer, see how many colors are right but not in right position
		#however can't go over the count for the original number of items in true answer
		incorrect_count=0
		temp_answer=@answer.dup
		temp_guess=@player_answer.dup

		temp_guess.each_with_index do |item, i|
			if(item==temp_answer[i]) 
				temp_answer[i]=nil
				temp_guess[i]=nil
			end
		end

		temp_guess.each_with_index do |item, i| #
			if(item!=nil&&temp_answer.include?(item))
				temp_answer[temp_answer.index(item)]=nil
				incorrect_count+=1
			end
		end
    return incorrect_count
	end

	def check_position #check for position/color, returns number of correct guesses, need to remove correct ones
		count=0
		@answer.each_with_index do |item, i|
			if(item==@player_answer[i])
				count+=1
			end
		end
		return count
	end

	def is_solved? #checks if solved, returns true if player answer matches true answer
		return true if @player_answer==@answer
		return false
	end

	def moves_left? #returns true if you still have moves left
		if(@row<@row_limit)
			return true
		end

		return false
	end

	def win_message #returns winning message if code is solved
		puts "-----------------------------------------------------------------------------"
		print "Congratulations! You've guess the code, it was #{@answer}"
	end

	def lose_message #returns losing message if code isn't solved
		puts "-----------------------------------------------------------------------------"
		print "Sorry, You've failed to solved the code in #{@row} rounds, the answer was #{@answer}"
	end

end