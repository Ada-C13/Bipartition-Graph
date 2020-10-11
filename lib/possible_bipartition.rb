
def possible_bipartition(dislikes)
  return true if dislikes.length < 2

  stack = []
  visited = {}

  # go through list list
  dislikes.each_index do |i|
    # if we haven't seen them before
    if !visited[i]
      # put them on the stack
      stack << i
      # put them in visited and assign them a pen
      visited[i] = "pen1"
    end

    # while there are still dogs in the stack
    while !stack.empty?
      curr_dog = stack.pop # pop one out
      disliked_dogs = dislikes[curr_dog] # identify who the current dog doesn't like 
  
      disliked_dogs.each do |dog| # look at the current dog's dislikes
        if !visited[dog] # if we haven't seen that dog before
          stack << dog # put it on the stack
          visited[dog] = which_pen(visited[curr_dog]) # assign the dog a pen
        elsif visited[dog] == visited[curr_dog] # (if we HAVE seen the dog before) && if the current dog is assigned to the same pen as a dog it dislikes
          return false # we can't do it!
        end
      end
    end
  end

  return true
end

def which_pen(pen)
  if pen == "pen1"
    return "pen2"
  else
    return "pen1"
  end
end