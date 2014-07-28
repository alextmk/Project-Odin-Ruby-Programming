class Node
	attr_accessor :next, :value
	def initialize(value,next_value=nil)
		@next=next_value
		@value=value
	end
end