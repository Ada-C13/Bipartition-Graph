def possible_bipartition(dislikes)
  return true if dislikes.empty?
  visited = {}
  queue = []
  dog_group = {}
  
  dislikes.length.times do |i|
    unless visited[i]
      visited[i] = true
      dog_group[i] = 1
      queue << i
    end

    until queue.empty?
      current = queue[0]
      queue.delete_at(0)

      dislikes[current].each do |neighbor|
        if !visited[neighbor]
          queue << neighbor
          visited[neighbor] = true
          dog_group[neighbor] = - dog_group[current]
        elsif dog_group[neighbor] == dog_group[current]
          return false
        end
      end
    end
  end

  true
end
