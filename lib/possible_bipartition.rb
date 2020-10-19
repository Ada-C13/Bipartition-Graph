# Time: O(n + e) - work with each node and with each edge
# Space: O(n + e) - created 2 additional arrays + use of system stack for recursion
# from 'Algorithms' by Robert Sedgewick
class Graph
  def possible_bipartition(dislikes)
    @is_two_colorable = true
    # keep track of visited puppies
    @visited = Array.new(dislikes.size, false)
    # color each puppy as false, meaning they all are kept in 1 play area now
    @color = Array.new(dislikes.size, false)
    dislikes.each_index do |i|
      if !@visited[i]
        dfs(dislikes, i)
      end
    end
    return @is_two_colorable
  end
  
  private 

  def dfs(dislikes, vertex)
    # mark as visited
    @visited[vertex] = true
    # for each dislike not yet visited give it an opposite color
    # meaning that they shouldn't be kept in 1 play area
    dislikes[vertex].each do |w|
      if !@visited[w]
        @color[w] = !@color[vertex]
        dfs(dislikes, w)
      else
        # if a puppy has already been visited and placed in the same play area,
        # it means there is a conflict, the given group of puppies can't be kept in 1 play area
        if @color[vertex] == @color[w]
          @is_two_colorable = false
        end
      end
    end
  end
end

def possible_bipartition(dislikes)
  graph = Graph.new
  graph.possible_bipartition(dislikes)
end
