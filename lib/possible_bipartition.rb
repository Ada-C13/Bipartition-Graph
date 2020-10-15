def possible_bipartition(dislikes)
  return true if dislikes.empty?
  colors = Array.new(dislikes.length)
  current = 1
  colors[current] = "red"
  q = [current]
  while q.length > 0
    current = q.shift
    dislikes[current].each do |child|
      q.push(child) if !colors[child]
      if colors[current] == "red"
        return false if colors[child] && colors[child] != "blue"
        colors[child] = "blue"
      else
        return false if colors[child] && colors[child] != "red"
        colors[child] = "red"
      end
    end
  end
  return true
end
