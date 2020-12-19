# Examples Input & Output
# Input: dislikes = [ [],
#                     [2, 3],
#                     [1, 4],
#                     [1],
#                     [2]
#                   ]
# Output: true

# If the first dog goes to group 1, any dog disliked by this dog must go to the opposite group -1. 
# Then, any dog disliked by -1 dog is 1 and so on.
# If at any point there is a conflict, the task is impossible.

# BFS (using queue)
# Time Complexity: O(n + e) - check every node and every edge
# Space complexity: O(n) - using a queue

def possible_bipartition(dislikes)
  return true if dislikes.empty? # empty graph
  
  visited_dogs = {}
  queue = []

  # elements in dislikes array represent dogs (and their dislikes)
  i = 0;
  while i < dislikes.length
    unless visited_dogs[i]
      visited_dogs[i] = 1 # keeps track of visited dogs + adds to group 1 by default
      queue << i
    end

    until queue.empty?
      current = queue.shift

      dislikes[current].each do |neighbor|
        if !visited_dogs[neighbor]
          queue << neighbor
          visited_dogs[neighbor] = - visited_dogs[current] # adds to the opposite group
        elsif visited_dogs[neighbor] == visited_dogs[current]
          return false
        end
      end
    end
    i += 1;
  end

  return true
end











# COLORS = [:red, :blue]

# def possible_bipartition(dislikes)
#   colored_dogs_graph = {}
#   current_color = 0

#   dislikes.each_with_index do |will_fight_with_array, i|
#     if !colored_dogs_graph[i]
#       colored_dogs_graph[i] = COLORS[current_color]
#       unless dfs(dislikes, i, colored_dogs_graph, current_color)
#         return false
#       end
#     end
#   end
  
#   return true
# end

# def dfs(dislikes, i, colored_dogs_graph, current_color)
#   will_fight_with_array = dislikes[i]
#   next_color = (current_color + 1) % COLORS.length

#   will_fight_with_array.each do |dog|
#     color = colored_dogs_graph[dog]

#     if color.nil?
#       colored_dogs_graph[dog] = COLORS[next_color]
#       if !dfs(dislikes, dog, colored_dogs_graph, next_color)
#         return false
#       end
    
#     elsif color != COLORS[next_color]
#       return false
#     end
#   end

#   return true
# end
