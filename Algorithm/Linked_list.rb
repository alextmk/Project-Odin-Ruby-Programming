require_relative 'Node'

class List #singly list

	def initialize(head_value=nil)
		@head=Node.new(head_value)
		@tail=@head
		@size=1
	end

	def insert_behind(value)
		temp=Node.new(value)
		if(@head.value==nil)
			@head=temp
			@tail=@head
		else
			current=@head
			while(current.next!=nil)
				current=current.next
			end
			current.next=temp
			@tail=temp
		end
		@size+=1
	end

	def insert_front(value)
		temp=Node.new(value)
		if(@head.value==nil)
			@head=temp
		else
			temp.next=@head
			@head=temp
		end
		@size+=1
	end

	def insert_behind_using_tail(value)
		temp=Node.new(value)
		if(@head==nil)
			@head=temp
			@tail=@head
		else
			@tail.next=temp
			@tail=@tail.next
		end
	end

	def node_to_array
		arr=[]
		current=@head
		while(current.next!=nil)
			arr<<current.value
			current=current.next
		end
		arr<<current.value
		return arr
	end

	#returns the nth node in the list 
	def nth(n)
		if(n>@size||n<0)
			raise "Cannot find that element because it does not exist"
		end
		current=@head
		while(current.next!=nil&&n>1)
			current=current.next
			n-=1
		end
		return current
	end

	#get size of list
	def get_size
		return "List is #{@size} elements large"
	end

	def print_list
		arr=node_to_array
		puts "[#{arr.join(",")}]"
	end

	def print_nth_node(n)
		puts "The #{n}th element is #{nth(n).value}"
	end

	def clear_list
		@head.value=nil
		@tail.value=nil
		@head.next=nil
		@tail.next=nil
		puts "List cleared!"
	end

	def array_to_list(arr)
		arr.each do |i|
			insert_front(i)
		end
	end
end

mylist=List.new(3)
mylist.insert_front(5)
mylist.insert_front(7)
puts mylist.get_size
mylist.insert_front(9)
mylist.print_list
mylist.insert_behind(8)
mylist.print_list
mylist.print_nth_node(4)
puts mylist.get_size
mylist.insert_behind_using_tail(5)
mylist.print_list
mylist.array_to_list([1,2,3,4])
mylist.print_list
mylist.clear_list
mylist.array_to_list([3,4,4,4,4,4,5])
mylist.print_list

