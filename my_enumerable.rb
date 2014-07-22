module Enumerable
  def my_each#iterate through every element
    if(!block_given?)
      return self
    end
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    if(!block_given?)
      return self
    end
    i=0
    while(i<self.length)
      yield(self[i],i)
      i+=1
    end
  end

  def my_select
    if(!block_given?)
      return self
    end
    new_arr=[]
    self.my_each do |i|
      if(yield(i))
        new_arr<<i
      end
    end
    return new_arr
  end

  def my_all?
    if(!block_given?)
      self.my_each do |i|
        return false unless i
      end
      return true
    end
    self.my_each do |i|
      if(!yield(i))
        return false
      end
    end
    return true
  end

  def my_any?
    if(!block_given?)
      return true if i
      return false
    end
    self.my_each do |i|
      if(yield(i))
        return true
      end
    end
    return false
  end

  def my_none?
    if(!block_given?)
      return false if i
      return true
    end
    self.my_each do |i|
      if(yield(i))
        return false
      end
    end
    return true
  end

  def my_count
    count=0
    self.my_each do |i|
      if(yield(i))
        count+=1
      end
    end
    return count
  end

  def my_map
    new_arr=[]
    self.my_each do |i|
      new_arr<<yield(i)
    end
    return new_arr
  end

  def my_inject(num=self[0])
    value=num
    (0..self.length-1).my_each do |i|
      value=yield(value,self[i])
    end
    return value
  end

  def my_map(&block)
    new_arr=[]
    if(block_given?)
      self.my_each do |i|
        new_arr<<block.call(i)
      end
      return new_arr
    else
      return self
    end
  end


end
