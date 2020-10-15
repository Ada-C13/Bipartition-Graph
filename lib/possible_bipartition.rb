def possible_bipartition(dislikes)
  assignment_group = [nil] * dislikes.length

  #need the outter loop in case the graph is disconnected 
  i = 0 
   while i < dislikes.length
    #check to see if dog has a group assignment
    #if it doesn't
    if assignment_group[i] == nil
      #add dog to queue 
      queue = []
      queue.append(i)
      until queue.empty?
        #Go through dog's dislikes 
        dog = queue.shift
        dislikes[dog].each do |disliked_dog|
          #check if they have an assignment
          if assignment_group[disliked_dog] != nil
            #make sure it's correct
            if assignment_group[dog] == assignment_group[disliked_dog]
              return false
            end
          else #if they don't have an assignment
            #assign and add to queue 
            if assignment_group[dog] == "red"
              assignment_group[disliked_dog] = "blue"
            else
              assignment_group[disliked_dog] = "red"
            end
            queue.append(disliked_dog)
          end
        end
      end
      #else just continue 
    end
    i += 1
  end
  return true
end


#another solution :)

# def possible_bipartition(dislikes)
#   binary_array = [-1] * dislikes.length

#   position = 0
#   while position < binary_array.length
#     if binary_array[position] == -1
#       if !breadth_first(dislikes, position, binary_array)
#         return false
#       end
#     end
#     position += 1
#   end
#   p binary_array
#   return true
# end

# def breadth_first(dislikes, position, binary_array)
#   queue = []
#   queue.append(position)

#   until queue.empty?
#     dog = queue.shift
#     dislikes[dog].each do |disliked_dog|
#       #check if haven't visited this dog yet
#       if binary_array[disliked_dog] == -1
#         #indicate if it's in group 0 or group 1
#         # if current dog is 0, the disliked should be in group 1 (1 - 0 = 1)
#         # if current dof is 1, the disliked should be in group 0 (1 - 1 = 0)
#         binary_array[disliked_dog] = 1 - binary_array[dog]
#         # Add the disliked dogs to the queue to check their connections
#         queue.append(disliked_dog)
#         #check if visited, return false if current dog will be group together with disliked dog
#       elsif binary_array[dog] == binary_array[disliked_dog]
#         return false
#       end
#     end
#   end
#   return true
# end
