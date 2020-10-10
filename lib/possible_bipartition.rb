def possible_bipartition(dislikes)
  dog_group = []
  dog = 0
  while dog < dislikes.length do
    dog_group << -1
    dog += 1
  end
  bad_pairs = build_pairs(dislikes)
  dog = 0
  while dog < dislikes.length do
    if dog_group[dog] == -1
      if set_group(bad_pairs, dog_group, dog, 0) == false
        return false
      end
    end
    dog += 1
  end
  return true
end

def build_pairs(dislikes)
  bad_pairs = []
  dog = 0
  while dog < dislikes.length do
    dog_dislike = dislikes[dog]
    i = 0
    while i < dog_dislike.length do
      bad_pairs << [dog, dog_dislike[i]]
      i += 1
    end
    dog += 1
  end
  return bad_pairs
end

def set_group(bad_pairs, dog_group, dog, group)
  dog_group[dog] = group
  i = 0
  while i < bad_pairs.length do
    if bad_pairs[i][0] == dog
      other_dog = bad_pairs[i][1]
      if dog_group[other_dog] == -1
        if set_group(bad_pairs, dog_group, other_dog, 1 - group) == false
          return false
        end
      else
        if dog_group[other_dog] == group && dog != other_dog
          return false
        end
      end
    end
    i += 1
  end                     
  return true
end