
###Used leetcode as a reference because my brain is a fried egg, 
###but I do understand why this solution works. 

def possible_bipartition(dislikes)
  return true if dislikes.empty?
  array = []
  
  dislikes.length.times do |i|
    if array[i].nil?
      array[i] = 1
    end
    
    return false if !helper(i, array, dislikes)
  end
  
  return true
end

def helper(i, array, dislikes)
  dislikes[i].each do |neighbor|
    if array[neighbor].nil?
      array[neighbor] = -array[i]
      return false if !helper(neighbor, array, dislikes)
    elsif array[neighbor] == array[i]
      return false
    end
  end
  
  return true
end
