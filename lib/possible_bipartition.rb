# in this assignment input dislikes is already an adjacency list
def possible_bipartition(dislikes)
  # https://en.wikipedia.org/wiki/Graph_coloring
  # assign bicolor red and blue : 0 as unvisited / 1 as red / -1 as blue
  color = Array.new(dislikes.length, 0)   
  queue = []

  v = 0
  while v < dislikes.length
    # find the entry node: assign first color to entry node and push into queue
    if color[v] == 0
      color[v] = 1
      queue.push(v)
    end
    
    # breadth-first search traversing the graph
    while !queue.empty?
      i = queue.shift

      dislikes[i].each do |n|
        # if this node is not visited yet, assign opposite color and push to queu 
        if color[n] == 0
          queue.push(n)
          color[n] = -color[i]
        else
          return false if color[n] == color[i]      # conflict if two vertices sharing the same edge have the same color
        end
      end
    end
    v += 1
  end

  return true
end


# def possible_bipartition(dislikes)
#   return true if dislikes == []
#   # to track bicolor: 0 as unassigned / 1: red / -1: blue
#   color = Array.new(dislikes.length, 0)   
#   queue = []

#   if dislikes[0].empty?
#     queue.push(1)
#     color[1] = 1
#   else
#     queue.push(0)
#     color[0] = 1
#   end

#   # breadth-first search traverse the tree and check
#   while !queue.empty?
#     i = queue.shift

#     dislikes[i].each do |n|
#       if color[n] == 0
#         queue.push(n)
#         color[n] = -color[i]
#         print queue
#       else
#         return false if color[n] == color[i]
#       end
#     end
#   end
#   print color

#   return true
# end