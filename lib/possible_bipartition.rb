
def possible_bipartition(alldogs)
  return true if alldogs.length == 0 || alldogs.length == 1

  visited = [0]
  enemyList = [alldogs[0]].flatten
  groupOne = [0]
  groupTwo = []

  if enemyList.empty?
    visited.push(1)
    groupOne.push(1)
    enemyList.concat(alldogs[1])
  end

  until visited.length == alldogs.length
    until enemyList.empty?
      spotlight = enemyList.shift

      if !visited.include?(spotlight)
        enemyList.concat(alldogs[spotlight])

        eligibleOne = true
        eligibleTwo = true

        enemies = alldogs[spotlight]

        enemies.each do |enemy|
          if groupOne.include?(enemy)
            eligibleOne = false
          end

          if groupTwo.include?(enemy)
            eligibleTwo = false
          end
        end

        if eligibleOne == false && eligibleTwo == false
          return false
        elsif eligibleOne == true && eligibleTwo == false
          groupOne.push(spotlight)
        elsif eligibleOne == false && eligibleTwo == true
          groupTwo.push(spotlight)
        elsif eligibleOne == true && eligibleTwo == true
          groupOne.push(spotlight)
        end
        visited.push(spotlight)
      end
    end
  end

  return true
end


# Notes on progression:
  # until visited length == alldogs length
    # pop front of the enemies line

    # if dog is not in the visited set
      # put dog in visited set
      # put dog's enemies in enemy line
      # eligibleOne = true
      # eligibleTwo = true

      # look at each of dog's enemies
        # if this dog is in the first group
          # eligibleOne = false
        # if this dog is in the second group
          # eligibleTwo = false
      # end 

      # if eligibleOne is still true and not Two
        # put dog in group one 
      # if two is true and one is false
        # put dog in group two
      # if both are false
        # return false
    # end
    # return true
