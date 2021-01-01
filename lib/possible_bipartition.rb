# modeled after: https://leetcode.com/problems/possible-bipartition/discuss/654955/Python-sol-by-DFS-and-coloring.-w-Graph

def possible_bipartition(dislikes)
  # recursive DFS, N = nodes, E = edges
  # Time complexity - O(N + E)
  # Space complexity - O(N + E)
  return true if dislikes.length == 1 || dislikes.empty?

  seen = {} # dictionary to keep track of dog area assignments

  # go through each dog and assign area assignments through node coloring
  for dog in 0..(dislikes.length - 1)
    if !seen.has_key?(dog)
      if !dfs_helper(dog, 1, seen, dislikes) # encounter color conflict
        return false
      end
    end
  end

  return true
end

def dfs_helper(dog, color, seen, dislikes)
  if seen.has_key?(dog)
    if seen[dog] != color #if we've already seen this dog and find a color conflict, cannot be bipartite
      return false
    end
  return true
  end

  seen[dog] = color

  for other_dog in dislikes[dog] # go through current dog's enemies
    if !dfs_helper(other_dog, -color, seen, dislikes)
      return false # for when the dog's enemy has a color conflict
    end
  end

  return true
end
