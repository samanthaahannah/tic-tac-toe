board =[[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]

class Player

  def initialize(marker)
    @marker = marker
  end

  def place_marker(board)
    p "place marker"
    input = gets.chomp.to_i
    if input > 0 && input < 4
        board[0][input - 1] = @marker
    elsif input >= 4 && input < 7
        board[1][input - 4] = @marker
    elsif input >= 7 && input < 10
        board[2][input - 7] = @marker
    else
      p "Invalid input: try again!"
        place_marker(board)
    end
  end
end

class Board
  def draw_board(board)
    puts "                                         "
    puts " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
    puts "-----------"
    puts " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
    puts "-----------"
    puts " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
  end
end

def play_game(board)
  main_board = Board.new
  main_board.draw_board(board)
  player1 = Player.new("X")
  player2 = Player.new("O")
  2.times do
    p player1.place_marker(board)
    main_board.draw_board(board)
    p player2.place_marker(board)
    main_board.draw_board(board)
  end
end

play_game(board)
