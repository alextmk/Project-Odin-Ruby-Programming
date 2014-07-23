require "./Player"

class Board
    #initializes board for game
	def initialize
		#use 2D array
		@board=[[0,0,0],[0,0,0],[0,0,0]]
		@piece=nil
		@size=0
	end

	def set_piece(player,location) #modifies board, takes in player object
		@piece=player.piece #is either "x" or "o", can be represented by 1 and 2 
		row=(location-1)/3
		column=(location+2)%3
		@board[row][column]=@piece
		@size+=1
	end

	def empty?(location)
		row=(location-1)/3
		column=(location+2)%3
		return true if @board[row][column]==0
		return false
	end

	def print_board(player=nil) #prints board
		(0..(@board.length)-1).each do |i| #i is each row
			(0..@board[i].length-1).each do |j| #j is each column
					if(@board[i][j]==0)
						marker="-"
					else
						marker=player.ply_num_to_str(@board[i][j])
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

	def check_win? #returns true or false
		return true if check_horizontal_win?||check_vertical_win?||check_diagnal_win?
		return false
	end
  
  def check_horizontal_win? #returns true if horizontal win
    @board.each do |i|
  	  if(i[0]!=0&&(i[0]==i[1]&&i[1]==i[2]))
        return true
      end
  	end
    return false
  end

  def check_vertical_win? #returns true if vertical win
  	(0...@board.length).each do |i| #columns
  			if(@board[0][i]!=0&&(@board[0][i])==@board[1][i]&&@board[0][i]==@board[2][i])
  				return true
  			end
  	end
  	return false
  end

  def check_diagnal_win? #checks diagnal win
  	first_diag=@board[1][1]!=0&&(@board[2][0]==@board[1][1]&&@board[2][0]==@board[0][2])
  	second_diag=@board[1][1]!=0&&(@board[0][0]==@board[1][1]&&@board[1][1]==@board[2][2])
  	return true if (first_diag||second_diag)
  	return false
  end
    

end