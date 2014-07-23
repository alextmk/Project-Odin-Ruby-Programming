require "./Game"

my_game=Game.new
my_game.welcome_message
while(!my_game.check_win&&!my_game.check_full)
	my_game.enter_move
	my_game.place_on_board
	my_game.show_board
	if(my_game.check_win)
		my_game.win_message
	elsif(my_game.check_full)
		my_game.tie_message
	else
		my_game.next_player
	end
end