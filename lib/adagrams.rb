# Chantelle and Semret (Pair-Programing)
# Adagram project
# 8/13/18

# defining method to populate letter pool per frequecies for each letter
def populate_letter_pool(letter_pool)
  total_letter_pool = []
  letter = ""
  ('A'..'Z').each do |char|
    if char == 'A'
      letter = "A" * 9
    elsif char == 'B'
      letter = "B" * 2
    elsif char == 'C'
      letter = "C" * 2
    elsif char == 'D'
      letter = "D" * 4
    elsif char == 'E'
      letter = "E" * 12
    elsif char == 'F'
      letter = "F" * 2
    elsif char == 'G'
      letter = "G" * 3
    elsif char == 'H'
      letter = "H" * 2
    elsif char == 'I'
      letter = "I" * 9
    elsif char == 'J'
      letter = "J" * 1
    elsif char == 'K'
      letter = "K" * 1
    elsif char == 'L'
      letter = "L" * 4
    elsif char == 'M'
      letter = "M" * 2
    elsif char == 'N'
      letter = "N" * 6
    elsif char == 'O'
      letter = "O" * 8
    elsif char == 'P'
      letter = "P" * 2
    elsif char == 'Q'
      letter = "Q" * 1
    elsif char == 'R'
      letter = "R" * 6
    elsif char == 'S'
      letter = "S" * 4
    elsif char == 'T'
      letter = "T" * 6
    elsif char == 'U'
      letter = "U" * 4
    elsif char == 'V'
      letter = "V" * 2
    elsif char == 'W'
      letter = "W" * 2
    elsif char == 'X'
      letter = "X" * 1
    elsif char == 'Y'
      letter = "Y" * 2
    elsif char == 'Z'
      letter = "Z" * 1
    end

    total_letter_pool << letter.split("")
  end

  return total_letter_pool.flatten
end

letter_pool = populate_letter_pool(letter_pool)

# puts "#{letter_pool}"

# Def draw method to return an array of 10 randomly selected letter from the pool of letter

def draw_letters
  random_draw = []
  letter_pool = populate_letter_pool(letter_pool)
  #random draw from array
  random_draw = letter_pool.sample(10)
  return random_draw
end



def uses_available_letters?(word, letter_in_hand)
  temp_hand = letter_in_hand.dup
  inputted_word = []
  inputted_word << word.split("")
  inputted_word.flatten!

  check_letter = true


  inputted_word.each do |letter|
    index = 0


    if !temp_hand.include?(letter)
      check_letter = false
    end

    if temp_hand.include?(letter)
      index = temp_hand.index(letter)
      temp_hand.delete_at(index)
    end

  end

  return check_letter

end


def score_word (word)

  this_letter = []
  this_letter << word.upcase.split("")
  this_letter.flatten!
  puts "#{this_letter}"

  score = 0
  this_letter.each do |value|


    case value
    when 'A', 'E', 'I', 'O' , 'U' , 'L' , 'N' , 'R' , 'S' , 'T'
      score += 1
    when 'D', 'G'
      score += 2
    when 'B', 'C', 'M', 'P'
      score += 3
    when 'F', 'H', 'V', 'W' , 'Y'
      score += 4
    when 'K'
      score += 5
    when 'J', 'X'
      score += 8
    when 'Q', 'Z'
      score += 10
    end
  end


  if word.length > 6 && word.length < 11
    score += 8
  end

  return score
end

def score_word (word)

  this_letter = []
  this_letter << word.upcase.split("")
  this_letter.flatten!
  #puts "#{this_letter}"

  score = 0
  this_letter.each do |value|

    case value
    when 'A', 'E', 'I', 'O' , 'U' , 'L' , 'N' , 'R' , 'S' , 'T'
      score += 1
    when 'D', 'G'
      score += 2
    when 'B', 'C', 'M', 'P'
      score += 3
    when 'F', 'H', 'V', 'W' , 'Y'
      score += 4
    when 'K'
      score += 5
    when 'J', 'X'
      score += 8
    when 'Q', 'Z'
      score += 10
    end
  end


  if word.length > 6 && word.length < 11
    score += 8
  end

  return score
end

# WAVE 4 SYNTAX

def highest_score_from(words)

  highest_scoring_hash = {
    :score => 0,
    :word => words.first
  }

  words.each do |word|
    current_score = score_word(word)
    current_word = word

    # puts "Incumbent #{highest_scoring_hash[:word]} (score #{highest_scoring_hash[:score]})"
    # puts "New word #{current_word} (score #{current_score})"

    if current_score > highest_scoring_hash[:score]
      # puts "new word has higher score, taking it"
      highest_scoring_hash[:score] = current_score
      highest_scoring_hash[:word] = current_word

      # in case of a score tie
    elsif current_score == highest_scoring_hash[:score]

      #fewer letter wins
      # if highest_scoring_hash[:word].length > current_word.length &&
      #   (highest_scoring_hash[:word].length != 10 && current_word.length !=10)
      #
      #   highest_scoring_hash[:score] = current_score
      #   highest_scoring_hash[:word] = current_word
      #
      # # word length of 10 wins
      # elsif current_word.length == 10 && highest_scoring_hash[:word].length < 10
      #   highest_scoring_hash[:score] = current_score
      #   highest_scoring_hash[:word] = current_word
      #   # when lengths are equal picking first (the one already stored in hash)
      # elsif current_word.length == highest_scoring_hash[:word].length ||
      #   highest_scoring_hash[:word].length == 10
      #   #do nothing
      # end
      #fewest words wins
      if current_word.length < highest_scoring_hash[:word].length && highest_scoring_hash[:word].length < 10
        # puts "current word is shorter"
        highest_scoring_hash[:score] = current_score
        highest_scoring_hash[:word] = current_word
      elsif highest_scoring_hash[:word].length < current_word.length && current_word.length  < 10
        # puts "current word is shorter"


        #elsif if 10, 10 wins
      elsif current_word.length == 10 && current_word.length > highest_scoring_hash[:word].length
        # puts "current word is length 10"
        highest_scoring_hash[:score] = current_score
        highest_scoring_hash[:word] = current_word

      elsif highest_scoring_hash[:word].length == 10 && highest_scoring_hash[:word].length > current_word.length
        # puts "Incumbent word is length 10"

        #elsif length equal, first wins
      elsif current_word.length == highest_scoring_hash[:word].length
        #do nothing

      end
    end
  end
  return highest_scoring_hash
end
