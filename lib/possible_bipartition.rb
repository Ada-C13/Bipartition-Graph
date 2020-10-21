def possible_bipartition(dislikes)
  color = Array.new(dislikes.length, 0) # 0 for unvisited and the 1 flops  
  queue = Array.new

  dislikes.length.times do |i|
    if color[i] == 0
      color[i] = 1
      queue.push(i)
    end

    while !queue.empty?
      popped = queue.pop

      dislikes[popped].each do |d|
        if color[d] == 0
          queue.push(d)
          color[d] = -color[popped]
        else
          return false if color[d] == color[popped]
        end
      end
    end
  end

  return true
end