# frozen_string_literal: true

# def possible_bipartition(n,dislikes)
#   dislikes.sort! { |a, b| a[0] <=> b[0] }
#   group1 = []
#   group2 = []
#   dislikes.each do |a, b|
#     if (group1.include?(a) && group1.include?(b)) || (group2.include?(a) && group2.include?(b))
#       return false
#     end

#     if !group1.include?(a) && !group2.include?(a) && !group1.include?(b) && !group2.include?(b)
#       group1 = [a]
#       group2 = [b]
#     else
#       group2 << b if group1.include?(a) && !group2.include?(b)
#       group1 << b if group2.include?(a) && !group1.include?(b)
#       group2 << a if group1.include?(b) && !group2.include?(a)
#       group1 << a if group2.include?(b) && !group1.include?(a)
#     end
#   end
#   true
# end

#  # time complexity: O(n + e)
#  # space complexcity: O(n)

def possible_bipartition(dislikes)
  num_of_dogs = dislikes.length
  stack = []
  dog_groups = {} # group true or false

  num_of_dogs.times do |i|
    unless dog_groups.key?(i)
      stack.push(i)
      dog_groups[i] = true
    end

    until stack.empty?
      # Remove an element from stack and store it in curr_dog
      curr_dog = stack.pop
      fighting_dogs = dislikes[curr_dog]

      fighting_dogs.each do |enemy_dogs|
        if !dog_groups[enemy_dogs]
          stack.push(enemy_dogs)

          # assign a different group from curr_dog since if they have history of fighting
          dog_groups[enemy_dogs] = !dog_groups[curr_dog]
        else
          # if they are in the same group although they are fighting_dogs
          return false if dog_groups[enemy_dogs] == dog_groups[curr_dog]
        end
      end
    end
  end
  true
end
