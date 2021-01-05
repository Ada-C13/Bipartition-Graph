# frozen_string_literal: true

# Time complexity: O(n)
# Space complexity: O(n)

def possible_bipartition(dislikes)
  u = []
  v = []
  dislikes.each do |dislike|
    if dislike.length > 2
      return false # if array has more than 2 elements, return false
    elsif dislike.length == 2 # partition starts
      if (u.include?(dislike[0]) && u.include?(dislike[1])) || (v.include?(dislike[0]) && v.include?(dislike[1]))
        return false
      end

      if !u.include?(dislike[0]) && !v.include?(dislike[0]) && !u.include?(dislike[1]) && !v.include?(dislike[1])
        u << dislike[0]
        v << dislike[1]
      else
        v << dislike[1] if u.include?(dislike[0]) && !v.include?(dislike[1])
        u << dislike[1] if v.include?(dislike[0]) && !u.include?(dislike[1])
        v << dislike[0] if u.include?(dislike[1]) && !v.include?(dislike[0])
        u << dislike[0] if v.include?(dislike[1]) && !u.include?(dislike[0])
      end
    end
  end
  true
end
