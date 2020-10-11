###### in this assignment input dislikes is already an adjacency list
def possible_bipartition(dislikes)
  # https://en.wikipedia.org/wiki/Graph_coloring
  # assign bicolor red and blue : 0 as unvisited / 1 as red / -1 as blue
  color = Array.new(dislikes.length, 0)   
  queue = Queue.new

  v = 0
  while v < dislikes.length
    # find the entry node: assign first color to entry node and push into queue
    if color[v] == 0
      color[v] = 1
      queue.push(v)
    end
    
    # breadth-first search traversing the graph
    while !queue.empty?
      i = queue.pop     # also aliased as deq / shift within the Queue class

      dislikes[i].each do |n|
        # if this node is not visited yet, assign opposite color and push to queue
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


###### alternative solution using Depth-first search (DFS) and a Stack
# def possible_bipartition(dislikes)
#   # assign bicolor red and blue : 0 as unvisited / 1 as red / -1 as blue
#   color = Array.new(dislikes.length, 0)   
#   stack = []
#   v = 0

#   while v < dislikes.length
#     # find the entry node: assign first color to entry node and push into stack
#     if color[v] == 0
#       color[v] = 1
#       stack.push(v)
#     end
    
#     # breadth-first search traversing the graph
#     while !stack.empty?
#       i = stack.pop     

#       dislikes[i].each do |n|
#         # if this node is not visited yet, assign opposite color and push to stack
#         if color[n] == 0
#           stack.push(n)
#           color[n] = -color[i]
#           # p stack
#         else
#           return false if color[n] == color[i]      # conflict if two vertices sharing the same edge have the same color
#         end
#       end
#     end
#     v += 1
#   end

#   return true
# end


###### alternative solution using Depth-first search (DFS) Recursively
# def possible_bipartition(dislikes)
#   # assign bicolor red and blue : 0 as unvisited / 1 as red / -1 as blue
#   colors = Array.new(dislikes.length, 0)   
#   i = 0
#   while i < dislikes.length
#     return false if colors[i] == 0 && !dfs(i, dislikes, colors, 1)   # if no color assigned and dfs returns false
#     i += 1
#   end

#   return true
# end

# # helper method -- recursion
# def dfs(v, dislikes, colors, color)
#   # base case: check if there is color conflict
#   if colors[v] != 0
#     return colors[v] == color
#   end

#   # if current node is NOT yet assigned color, assign color and check neighbors
#   colors[v] = color

#   if dislikes[v].empty?                                    # if no connecting nodes, there is no conflict, return true
#     return true
#   else
#     dislikes[v].each do |n|
#       return false if !dfs(n, dislikes, colors, -color)    # check each connecting node
#     end
#   end

#   return true
# end