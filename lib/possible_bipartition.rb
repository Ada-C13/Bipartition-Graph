
def possible_bipartition(dislikes)

  color_hash = {
    "red" => "blue",
    "blue" => "red"
  }

  visited_nodes = Array.new(dislikes.length, "unknown")

  for i in 0...dislikes.length do
    start_node = i
    if visited_nodes[start_node] == "unknown"
      # arbitrarily pick blue to start
      visited_nodes[start_node] = "blue"
    end

    q = Queue.new()
    q.push(start_node)
    while !q.empty?
      current = q.pop()
      current_color = visited_nodes[current]

      dislikes[current].length.times do |i|
        neighbor = dislikes[current][i]

        if visited_nodes[neighbor] == current_color 
          return false
        elsif visited_nodes[neighbor] == "unknown"
          # first time seeing this one
          # assign it the opposite of current color and push onto q
          visited_nodes[neighbor] = color_hash[current_color]
          q.push(neighbor)
        else
          # do nothing, it's a valid color pairing
        end
      end
    end
  end

  return true
end