class TicTacToe
    attr_accessor :board
  
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]              # Diagonals
    ]
  
    def initialize
      @board = Array.new(9, " ")
    end
  
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  
    def input_to_index(input)
      input.to_i - 1
    end
  
    def move(index, token = "X")
      @board[index] = token
    end
  
    def position_taken?(index)
      @board[index] != " "
    end
  
    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end
  
    def turn_count
      @board.count { |cell| cell != " " }
    end
  
    def current_player
      turn_count.even? ? "X" : "O"
    end
  
    def turn
      puts "Player #{current_player}, enter your move (1-9):"
      input = gets.strip
      index = input_to_index(input)
  
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "Invalid move. Try again."
        turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.detect do |combo|
        positions = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
        positions.all? { |position| position == "X" } || positions.all? { |position| position == "O" }
      end
    end
  
    def full?
      @board.all? { |cell| cell != " " }
    end
  
    def draw?
      !won? && full?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if combo = won?
        @board[combo[0]]
      end
    end
  
    def play
      display_board
  
      until over?
        turn
      end
  
      if won?
        puts "Congratulations! Player #{winner} wins!"
      else
        puts "It's a draw!"
      end
    end
  end
  def turn
    puts "Player #{current_player}, enter your move (1-9):"
    input = gets.strip
    index = input_to_index(input)
  
    if valid_move?(index)
      move(index, current_player)
      display_board
      current_player # Add this line to return the current player
    else
      puts "Invalid move. Try again."
      turn
    end
  end
  