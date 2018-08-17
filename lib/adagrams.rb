# Chantelle and Semret (Pair-Programing)
# Adagram project
# 8/13/18
require 'csv'

# WAVE 1 SYNTAX
def draw_letters

  random_draw = []

  letter_pool = ('A'..'Z').map do |char|
    case char
    when 'A', 'I'
      letter = char * 9
    when 'B', 'C', 'F', 'H', 'M', 'P', 'V', 'W', 'Y'
      letter = char * 2
    when 'D', 'L', 'S', 'U'
      letter = char * 4
    when 'E'
      letter = char * 12
    when 'G'
      letter = char * 3
    when 'J', 'K', 'Q', 'X', 'Z'
      letter = char * 1
    when 'N', 'R', 'T'
      letter = char * 6
    when 'O'
      letter = char * 8
    end
  end

  split_letter_pool = letter_pool.map do |chars|
    chars.split("")
  end

  #random draw of 10 from array and flatten the letter pool
  random_draw = split_letter_pool.flatten.sample(10)
  return random_draw

end

# puts "Random draw: #{draw_letters}"

def uses_available_letters?(word, letter_in_hand)
  temp_hand = letter_in_hand.dup
  inputted_word = []
  inputted_word << word.upcase.split("")
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

# WAVE 3 SYNTAX
# Scoring the word based on above parameters of scoring chart
def score_word (word)

  this_letter = []
  this_letter << word.upcase.split("")
  this_letter.flatten!

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

  # creating a hash to store highest scoring word with its score value
  highest_scoring_hash = {
    :score => 0,
    :word => words.first
  }

  # loop thur the array and test for score and word length to identify highest scoring word
  words.each do |word|
    current_score = score_word(word)
    current_word = word

    # word that has the highest score wins
    if current_score > highest_scoring_hash[:score]

      highest_scoring_hash[:score] = current_score
      highest_scoring_hash[:word] = current_word

      # in case of a score tie
    elsif current_score == highest_scoring_hash[:score]

      #f ewer letter wins
      if highest_scoring_hash[:word].length > current_word.length &&
        (highest_scoring_hash[:word].length != 10 && current_word.length !=10)

        highest_scoring_hash[:score] = current_score
        highest_scoring_hash[:word] = current_word

        # word length of 10 wins
      elsif current_word.length == 10 && highest_scoring_hash[:word].length < 10
        highest_scoring_hash[:score] = current_score
        highest_scoring_hash[:word] = current_word
        # when lengths are equal picking first (the one already stored in hash)
      elsif current_word.length == highest_scoring_hash[:word].length ||
        highest_scoring_hash[:word].length == 10
        # do nothing
      end
    end
  end
  return highest_scoring_hash
end

# WAVE 5 SYNTAX
# is it a valid dictionary word?
def is_in_english_dict?(input)


  results = false
  dictionary = CSV.read("assets/dictionary-english.csv",headers: true, header_converters: :symbol)
  dictionary.each do |word|
    word.each do |k, v|
      if v.downcase == input.downcase
        results = true
      end
    end
  end
  return results
end
