
def possible_bipartition(dislikes)
  
  nodes = []

  if dislikes == []
    return true
  end

  indexCounter = 0
  dislikes.each do |dog| 
    nodes.push([false, dog, '', indexCounter])
    indexCounter += 1
  end

  startNode = nodes[0]
  queue = []
  queue = queue.push(startNode)
  counter = 0
 
  while queue.length > 0 || (counter <= (nodes.length - 1) )
  
    if queue.length == 0
      current = nodes[counter]
    else
      current = queue[0]
    end

    if queue.length == 1
      queue.pop 
    elsif queue.length > 1
      queue = queue.slice(1, queue.length - 1)
    end
    
    current[0] = true

    if current[1] == []
      counter += 1
      current[2] == "red"
      nodes[current[3]] = current
      next
    end

    currentEdgeColors = []
    current[1].each do |connectedDog|
      if nodes[connectedDog][0] == false
        dogNode = nodes[connectedDog]
        queue = queue.push(dogNode)
      else 
        currentEdgeColors.push(nodes[connectedDog][2])
      end
    end

    if currentEdgeColors.include?("blue") && currentEdgeColors.include?("red")
      return false
    elsif currentEdgeColors.include?("blue")
      current[2] = "red"
    elsif currentEdgeColors.include?("red")
      current[2] = "blue"
    else
      current[2] = "blue"
    end

    nodes[current[3]] = current
    counter += 1
  end

  return true
end



