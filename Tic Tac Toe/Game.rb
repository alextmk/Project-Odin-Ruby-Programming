require "./Player"
require "./Board"

class Game

	def initialize
		@my_board=Board.new
		@player1=Player.new(1)
		@player2=Player.new(2)
		@current=@player1
		@location=nil
	end

	def welcome_message
		print "Welcome to the game! Player 1 is X, and Player 2 is O"
		puts ""
		@my_board.print_board
	end

	def enter_move
		print "Player #{@current.piece} Please select a location to place your piece, 1-9"
		puts ""
		@location=gets.chomp.to_i
		
	end

	def next_player
		if(@current==@player1)
			@current=@player2
		else
			@current=@player1
		end
	end

	def show_board
		@my_board.print_board(@current)
	end

	def place_on_board
			while(!@my_board.empty?(@location))
				print "That location is not valid, pick another location please select another location 1-9"
				puts ""
				@location=gets.chomp.to_i
			end
			@my_board.set_piece(@current,@location)
	end

	def win_message
		print "player #{@current.piece} won!"
	end

	def tie_message
		print "It's a tie" if @my_board.check_full?
	end

	def check_win
		return @my_board.check_win?
	end

	def check_full
		return @my_board.check_full?
	end
end