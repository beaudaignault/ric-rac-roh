class Game 

  def new_game
    puts "Welcome to Rick Rack Roh!\nEnter a1, b2, etc., to play."
    @board = {
      a1: nil, b1: nil, c1: nil,
      a2: nil, b2: nil, c2: nil,
      a3: nil, b3: nil, c3: nil
    }
    @turn = 'X'
    @winner = nil
    @get_winner = false
  end

  def draw_board
    puts "    A     B     C"
    puts " "
    puts "1)  #{@board[:a1]}  |  #{@board[:b1]} | #{@board[:c1]}"
    puts "   ················"
    puts "2)  #{@board[:a2]}  |  #{@board[:b2]} | #{@board[:c2]}"
    puts "   ················"
    puts "3)  #{@board[:a3]}  |  #{@board[:b3]} | #{@board[:c3]}"
  end

  def play
    new_game
    draw_board
    until @winner do  
      puts "Enter your play"
      @move = gets.chomp.downcase.to_sym 
      @board[@move] = @turn
      @turn = (@turn == "X") ? "O" : "X"
      draw_board
      @winner = get_winner
    end  
    @turn = (@turn == "X") ? "O" : "X"  
    puts "#{@turn} has won."
  end

  def get_winner
    if (@board[:a1] == @board[:b1])  && (@board[:b1] == @board[:c1]) && (@board[:a1] != nil) || # <-- Hz
      (@board[:a2] == @board[:b2]) && (@board[:b2] == @board[:c2]) && (@board[:a2]!= nil) || # <-- Hz
      (@board[:a3] == @board[:b3]) && (@board[:b3] == @board[:c3]) && (@board[:a3]!= nil) || # <-- Hz
      (@board[:a1] == @board[:a2]) && (@board[:a2] == @board[:a3]) && (@board[:a1]!= nil) || # <-- Vt
      (@board[:b1] == @board[:b2]) && (@board[:b2] == @board[:b3]) && (@board[:b1]!= nil) || # <-- Vt
      (@board[:c1] == @board[:c2]) && (@board[:c2] == @board[:c3]) && (@board[:c1]!= nil) || # <-- Vt
      (@board[:a1] == @board[:b2]) && (@board[:b2] == @board[:c3]) && (@board[:a1]!= nil) || # <-- Di
      (@board[:a3] == @board[:b2]) && (@board[:b2] == @board[:c1]) && (@board[:c1]!= nil)   # <-- Di
        return true
    end
    # puts "#{@turn} has won." 
    # @winner = @turn
    return nil
    # @get_winner = true
  end 
end

# initialize board,
  # turn = :, winner = nil, print heading,
# until win or tie, 
  # print board, loop- until valid move (coords , if not taken), prompt play, get move, update board, switch turn, update winnner, print updated board, print win/tie msg
  #check if hash key exist method 

