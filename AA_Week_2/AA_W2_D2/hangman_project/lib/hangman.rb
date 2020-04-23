class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  
  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    new_arr = []

    @secret_word.each_char.with_index do |c, i|
      new_arr << i if c == char
    end

    new_arr
  end

  def fill_indices(char, indices)

    @guess_word.each_with_index do |c, i|
      @guess_word[i] = char if indices.include?(i)
    end

  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
    end

    indices = get_matching_indices(char)


    if indices.length == 0
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char,indices)
    end

    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      print @secret_word
      return true
    else
      return false
    end
  end

end
