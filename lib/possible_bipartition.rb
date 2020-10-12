# dfs
# time complexity: O(n + e) => because each node and edge will be visited (where N is the number of nodes and E is the number of edges in the graph) 
# space complexity: O(n) => In the worst case, each node will be added to the stack (where n is the number of nodes)
def possible_bipartition(dislikes) #[ [3, 6],[2, 5], [1, 3], [0, 2], [5], [1, 4], [0]]
  num_of_dogs = dislikes.length 
  stack = []
  dog_groups = {} # distinguish groups as 1 and -1

  num_of_dogs.times do |i|
    if !dog_groups.has_key?(i)
      stack.push(i)
      dog_groups[i] = 1
    end

    until stack.empty?
      # remove an element from stack and store it in current_dog
      current_dog = stack.pop
      enemies = dislikes[current_dog] 

      # loop through all the neighbors called `enemies` of the current_dog
      enemies.each do |enemy| 
        if !dog_groups[enemy] 
          stack.push(enemy)

          # assign a different group from the current dog since they have history of fighting
          dog_groups[enemy] = dog_groups[current_dog] * -1 
        else 

          # if they are in the same group although they are enemies
          if dog_groups[enemy] == dog_groups[current_dog] 
            return false 
          end
        end 
      end
    end 
  end
  return true
end


# resources:
# https://learn-2.galvanize.com/cohorts/2173/blocks/867/content_files/08-graphs/graphs.md
# https://www.interviewcake.com/concept/java/bfs
# https://www.interviewcake.com/concept/java/dfs
# https://www.interviewcake.com/question/ruby/graph-coloring
# https://leetcode.com/problems/possible-bipartition/