class Algos

	def merge_sort(arr)
		if(arr.length<=1)
			return arr
		end
		mid=arr.length-1
		#break into 2 parts
		part_a=merge_sort(arr.slice(0,mid))
		part_b=merge_sort(arr.slice(mid,arr.length-mid))
		#conquer
		arr=[]
		index_a=0
		index_b=0

		while(index_a<part_a.length&&index_b<part_b.length)
			if(part_a[index_a]<part_b[index_b])
				arr<<part_a[index_a]
				index_a+=1
			else
				arr<<part_b[index_b]
				index_b+=1
			end
		end
		while(index_a<part_a.length)
			arr<<part_a[index_a]
			index_a+=1
		end
		while(index_b<part_b.length)
			arr<<part_b[index_b]
			index_b+=1
		end

		return arr
	end

	#search for key in an already sorted array
	def binary_search(arr,key,from=0,to=nil)
		if(to==nil)
			to=arr.length-1
		end

		#start from middle and see if that's key
		mid=(from+to)/2 
		if(arr[mid]==key)
			return mid
		elsif(arr[mid]>key)
			return binary_search(arr,key,from,mid)
		elsif(arr[mid]<key)
			return binary_search(arr,key,mid+1,to)
		end
	end
end