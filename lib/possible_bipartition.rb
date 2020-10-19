# time complexity: o(N+E) -> N = numbder of dogs , E = number of enemies
# space complexity: o(N) -> N = number of dogs
def possible_bipartition(dislikes) 
  dog_colors = {}
  queue = []

  dislikes.length.times do |i|
    if !dog_colors.has_key?(i)
      dog_colors[i] = true
      queue << i
    end

    while !queue.empty?
      current = queue.shift
      enemies = dislikes[current]
      
      enemies.each do |enemy|
        if !dog_colors[enemy] 
          queue << enemy
          dog_colors[enemy] = !dog_colors[current]
        elsif dog_colors[enemy] == dog_colors[current]
          return false
        end
      end
    end
  end
  return true
end

# references:
# Talk to Hannah J 
# https://www.geeksforgeeks.org/bipartite-graph/