
#   dislikes = [ [],
#   [2, 3],
#   [1, 4],
#   [1],
#   [2]
# ]

def possible_bipartition(dislikes)
  dislikes.each_index do |dog|
    if helper(dislikes,dog) == false 
      return false 
    end 
  end 
  return true 
end 


def helper(dislikes, node)
  visited = {}

  queue = []
  queue.push(node)
 
  visited[node] = "red"
  while !queue.empty? 
    current = queue[0]
    queue = queue.drop(1)
  
    dislikes[current].each do |neighbor|
      if visited[neighbor]
        return false if visited[current] == visited[neighbor]
      else 
        visited[neighbor] = visited[current] == "red" ? "blue": "red"
        queue.push(neighbor)
      end 
    end 
  end
  return true 
end 