def stock_picker(arr)
    max=nil
    buy=0
    sell=0
    (0..arr.length-2).each do |i|
        (i+1..arr.length-1).each do |j|
            diff=arr[j]-arr[i]
            if(max==nil||diff>max)
                max=diff
                buy=i
                sell=j
            end
        end
    end
    
    arr=[]
    arr<<buy<<sell
    return arr
            
    
    
end