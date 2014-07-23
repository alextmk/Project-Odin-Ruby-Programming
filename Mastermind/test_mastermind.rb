require "./Mastermind"

test = Mastermind.new(4,12)
test.welcome_message
puts "Would you like to select the code? type in 1 for yes, and anything else for computer to choose."
selection=gets.chomp.to_i
test.populate(selection)
while(!test.is_solved?&&test.moves_left?)
	test.take_guess
	if(test.is_solved?)
		test.win_message
		break
	elsif(!test.moves_left?)
		test.lose_message
		break
	else
		test.feed_back
	end
end