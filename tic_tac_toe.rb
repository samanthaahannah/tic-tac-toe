require_relative 'lib/board'
require_relative 'lib/player'

board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
endgame = false
marker = "O"

def restart(board, endgame, marker)
  board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
  endgame = false
  marker = 'O'
  play_game(board, endgame, marker)
end

def get_answer(board, endgame, marker, input)
  case
  when input.downcase == 'y'
    restart(board, endgame, marker)
  when input.downcase == 'n' 
    puts "Closing game"
    exit
  else
    puts "Invalid input"
    play_game(board, endgame, marker)
  end
end

def play_game(board, endgame, marker)
  main_board = Board.new
  player = Player.new
  main_board.draw_board(board)
  unless endgame == true
    if marker == "X"
      marker = "O"
    elsif marker == "O"
      marker = "X"
    end
    p endgame
    player.place_marker(board, marker, endgame)
    player.get_winning_lines(board, endgame, marker)
  else
    puts "Do you want to play again?"
    input = gets.chomp
    get_answer(board, endgame, marker, input)
  end
end

play_game(board, endgame, marker)
