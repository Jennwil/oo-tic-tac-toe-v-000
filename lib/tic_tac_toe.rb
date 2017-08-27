class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  def board= (board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8],
    ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    board[index] = current_player
  end

  def position_taken?(location)
    board[location] != " " && board[location] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    board.each do | player_turn |
    if player_turn == "X" || player_turn == "O"
      counter += 1
    end
  end
  counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      win_combination.all?{|i| board[i] == "X"} || win_combination.all?{|i| board[i] == "O"}
    end
  end

  def full?
    if board.any?{|i| i != "X" && i != "O"}
     false
    else board.all?{|i| i != " "}
      true
    end
  end

  def draw?
    if !won? && full?
      true
    elsif won? == false && full == false
      false
    else
      false
    end
  end

  def over?
     if won? || draw?
       true
     else
       false
     end
   end

  def winner
    if won?
      return board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end
end
