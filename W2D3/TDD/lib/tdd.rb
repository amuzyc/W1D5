class Array
  def my_uniq
    i=0
    return_array = []
    while i<self.length
      return_array << self[i] unless return_array.include?(self[i])
      i += 1
    end
    return_array
  end

  def two_sum
    return_array = []
    self.each_with_index do |el,index|
      other = index + 1
      while other < self.length
        return_array << [index, other] if el + self[other] == 0
        other += 1
      end
    end
    return_array
  end



end

def my_transpose(array)
  result_array = []
  index = 0
  while index < array.length
    col = []
    array.each do |el|
      col << el[index]
    end
    index += 1
    result_array << col
  end
  result_array
end

def stock_picker(array)
  result=[0,1]
  profit = array[1]-array[0]

  array.each_with_index do |v1, i|
    array.each_with_index do |v2, j|
      next if i >= j
      dif = v2 - v1
      if dif > profit
        result = [i, j]
        profit = dif
      end
    end
  end
  result
end
