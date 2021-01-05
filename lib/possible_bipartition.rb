# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)

def possible_bipartition(dislikes)
  return true if dislikes.empty?

  group1 = []
  group2 = []
  dislikes.each do |dogs|
    if dogs.length > 2 # if array has more than 2 elements, return false
      return false
    elsif dogs.length == 2 # partition starts
      if (group1.include?(dogs[0]) && group1.include?(dogs[1])) || (group2.include?(dogs[0]) && group2.include?(dogs[1]))
        return false
      end

      if !group1.include?(dogs[0]) && !group2.include?(dogs[0]) && !group1.include?(dogs[1]) && !group2.include?(dogs[1])
        group1 << dogs[0]
        group2 << dogs[1]
      else
        group2 << dogs[1] if group1.include?(dogs[0]) && !group2.include?(dogs[1])
        group1 << dogs[1] if group2.include?(dogs[0]) && !group1.include?(dogs[1])
        group2 << dogs[0] if group1.include?(dogs[1]) && !group2.include?(dogs[0])
        group1 << dogs[0] if group2.include?(dogs[1]) && !group1.include?(dogs[0])
      end
    end
  end
  true
end
