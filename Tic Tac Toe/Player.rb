class Player
	attr_accessor :piece

	def initialize(num)
		@piece=num
	end

	def ply_num_to_str(num) #returns str representation of player
		if(num==1)
			return "X"
		else
			return "O"
		end
	end
end