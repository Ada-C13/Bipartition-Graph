dislikes = [[],
            [2, 3],
            [1, 4],
            [1],
            [2]]

def possible_bipartition(dislikes)
  if (dislikes.empty?)
    return true
  end
  queue = [1]
  colors = Array.new(dislikes.length)
  colors[1] = "red"

  until (queue.empty?)
    current = queue.shift
    color = colors[current]
    neighbors = dislikes[current]

    neighbors.each do |neighbor|
      assignment = color == "blue" ? "red" : "blue"
      if (colors[neighbor] == nil)
        colors[neighbor] = assignment
        queue.push(neighbor)
      else
        return false if (colors[neighbor] != assignment)
      end
    end
  end
  return true
end

possible_bipartition(dislikes)
