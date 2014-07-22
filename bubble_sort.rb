def bubble_sort(arr)
	swapped=true
	while(swapped)
		swapped=false
		(0...arr.length-1).each do |i| #swap here 
			if(arr[i]>arr[i+1])
				swapped=true
				temp=arr[i+1]
				arr[i+1]=arr[i]
				arr[i]=temp
			end
		end
	end
	return arr
end

def bubble_sort_by(arr)
  sort= Proc.new {|i,j| i.length <=> j.length}
  swapped=true
  while(swapped)
    swapped=false
    (0...arr.length-1).each do |i|
      if(sort.call(arr[i],arr[i+1])==1)
        swapped=true
        temp=arr[i+1]
        arr[i+1]=arr[i]
        arr[i]=temp
      end
    end
  end
  return arr
end