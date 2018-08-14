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

puts "#{draw_letters}"
