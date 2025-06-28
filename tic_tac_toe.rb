board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
endgame = false
marker = "O"

class Player
  def place_marker(board, marker)
    p "place marker"
    input = gets.chomp.to_i
    if !board.flatten.none?(" ")
      if input > 0 && input < 4 && board[0][input - 1] == " "
          board[0][input - 1] = marker
      elsif input >= 4 && input < 7 && board[1][input - 4] == " "
          board[1][input - 4] = marker
      elsif input >= 7 && input < 10 && board[2][input - 7] == " "
          board[2][input - 7] = marker
      else
        p "Invalid input: try again!"
          place_marker(board, marker)
      end
    else 
      p "It's a draw!"
    end
  end

  def get_winner(board, winning_combos, endgame, marker)
    row1 = winning_combos.flatten.slice(0, 3)
    row2 = winning_combos.flatten.slice(3, 3)
    row3 = winning_combos.flatten.slice(6, 3)
    col1 = winning_combos.flatten.slice(9, 3)
    col2 = winning_combos.flatten.slice(12, 3)
    col3 = winning_combos.flatten.slice(15, 3)
    diag1 = winning_combos.flatten.slice(18, 3)
    diag2 = winning_combos.flatten.slice(21, 3)

    player_1 = [row1.all?("X"), row2.all?("X"), row3.all?("X"), col1.all?("X"), col2.all?("X"), col3.all?("X"), diag1.all?("X"), diag2.all?("X")]
    player_2 = [row1.all?("O"), row2.all?("O"), row3.all?("O"), col1.all?("O"), col2.all?("O"), col3.all?("O"), diag1.all?("O"), diag2.all?("O")]

    case
    when player_1.one? == true
      puts "Player 1 is the winner"
      endgame = true
      play_game(board, endgame, marker)
    when player_2.one? == true
      puts "Player 2 is the winner"
      endgame = true
      play_game(board, endgame, marker)
    else
      endgame = false
      play_game(board, endgame, marker)
    end
  end

  def get_winning_lines(board, endgame, marker)
    row1 = board[0].flatten
    row2 = board[1].flatten
    row3 = board[2].flatten

    col1 = [board[0][0], board[1][0], board[2][0]].flatten
    col2 = [board[0][1], board[1][1], board[2][1]].flatten
    col3 = [board[0][2], board[1][2], board[2][2]].flatten

    diag1 = [board[0][0], board[1][1], board[2][2]].flatten
    diag2 = [board[0][2], board[1][1], board[2][0]].flatten

    winning_combos = [row1, row2, row3, col1, col2, col3, diag1, diag2]

    get_winner(board, winning_combos, endgame, marker)
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

def restart(board, endgame, marker)
  board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
  endgame = false
  marker = 'O'
  play_game(board, endgame, marker)
end

def get_answer(board, endgame, marker, input)
  if input.downcase == 'y'
    restart(board, endgame, marker)
  elsif input.downcase == 'n'
     "Closing game"
  else
    puts "Invalid input"
    play_game(board, endgame, marker)
  end
end

def play_game(board, endgame, marker)
  main_board = Board.new
  player = Player.new
  main_board.draw_board(board)
  if endgame == false
    if marker == "X"
      marker = "O"
    elsif marker == "O"
      marker = "X"
    end
    player.place_marker(board, marker)
    player.get_winning_lines(board, endgame, marker)
  elsif endgame == true
    puts "Do you want to play again?"
    input = gets.chomp
    get_answer(board, endgame, marker, input)
  end
end

play_game(board, endgame, marker)
