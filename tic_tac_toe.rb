require_relative 'lib/board'
require_relative 'lib/player'

board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
endgame = false
marker = "O"

def restart(main_board, player, board, endgame, marker)
  board = [[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]
  endgame = false
  marker = 'O'
  play_game(main_board, player, board, endgame, marker)
end

def get_answer(main_board, player, board, endgame, marker, input)
  case
  when input.downcase == 'y'
    restart(main_board, player, board, endgame, marker)
  when input.downcase == 'n' 
    puts "Closing game"
    exit
  else
    puts "Invalid input"
    play_game(main_board, player, board, endgame, marker)
  end
end

def end_game(main_board, player, board, endgame, marker)
  puts "Do you want to play again?"
  input = gets.chomp
  get_answer(main_board, player, board, endgame, marker, input)
end

def play_game(main_board, player, board, endgame, marker)
  main_board.draw_board(board)
  unless endgame == true
    if marker == "X" then marker = "O"
    elsif marker == "O" then marker = "X" end
    player.place_marker(board, marker, endgame)
    player.get_winning_lines(main_board, player, board, endgame, marker)
  else
    end_game(main_board, player, board, endgame, marker)
  end
end

main_board = Board.new
player = Player.new


play_game(main_board, player, board, endgame, marker)
