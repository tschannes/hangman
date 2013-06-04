class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer, :string

  def initialize()
    @string = ""
    @chances = 8
    @guesses = []
    @word    = LIST.sample
    @board   = draw_board(@word)
  end
  
  # return @guesses as a string
  def guesses
  	@guesses.join(", ")
  end
  
  # return a string of underscores equal to length of the given word
  def draw_board(word)
    (word.length).times do |i|
      string << ("_ ")
    end
    return string
  end

  # return true if word has letter
  def word_has?(letter)
  	word.each_char do |char| 
      if char == letter
        true
      else
        false
      end
    end
  end

  # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  def put_letter_on_board(letter)
    board = string.split("")
    array_of_letters = word.split("")
    array_of_letters.each_with_index do |l, i|
      if l == letter
        board[i] = word[i]
      end
    end
  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
  	@guesses << letter
    chances -= 1
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    if word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    true
    board.each do |letter|
      if letter == "_"
        false
      end
    end
  end

  # return true if @chances is 0, otherwise return false
  def lost?
    if chances == 0 && board != word
        true
    else
        false
    end
  end
  
end