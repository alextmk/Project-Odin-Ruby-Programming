
class Board
    #initializes board for game
	def initialize
		#use 2D array
		@board=[[0,0,0],[0,0,0],[0,0,0]]
		@piece=nil
		@size=0
	end

	def set_piece(player,location) #modifies board, takes in player object
		@piece=player.piece #is either "x" or "o"
		row=location/3
		column=(location+2)%3
		@board[row][location]=@piece
		@size+=1
	end

	def print_board #prints board
		(0..(@board.length)-1).each do |i| #i is each row
			(0..@board[i].length-1).each do |j| #j is each column
					if(@board[i][j]==0)
						marker="-"
					end
			    print "#{marker}"
          print "|" unless j==@board.length-1
			end
            puts ""
		end
	end

	def check_full? #checks full_board
  	return true if @size==9
	end

	def check_win?
	end
    
    

end


test=Board.new
test.print_board
