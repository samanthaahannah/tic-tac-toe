class Player
  def place_marker(board, marker, endgame)
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
          place_marker(board, marker, endgame)
      end
    end
  end

  def get_winner(main_board, player, board, endgame, marker, rows, cols, diags, draw, player1, player2)
    case
    when player1 == true && draw == false
      puts "Player 1 wins!"
      endgame = true
      play_game(main_board, player, board, endgame, marker)
    when player2 == true && draw == false
      puts "Player 2 wins!"
      endgame = true
      play_game(main_board, player, board, endgame, marker)
    when draw == true
      puts "It's a draw"
      endgame = true
      play_game(main_board, player, board, endgame, marker)
    else
      endgame = false
      play_game(main_board, player, board, endgame, marker)
    end
  end

  def get_winning_lines(main_board, player, board, endgame, marker)
    rows = [board[0].flatten, board[1].flatten, board[2].flatten]

    cols = [[board[0][0], board[1][0], board[2][0]].flatten, 
            [board[0][1], board[1][1], board[2][1]].flatten,
            [board[0][2], board[1][2], board[2][2]].flatten]

    diags = [[board[0][0], board[1][1], board[2][2]].flatten, 
             [board[0][2], board[1][1], board[2][0]].flatten]

    player1_arr = [rows.any?{ |rows| rows.all? { |char| char == "X"}}, 
                   cols.any?{ |cols| cols.all? { |char| char == "X"}},
                   diags.any?{ |cols| cols.all? { |char| char == "X"}}]
            
    player2_arr = [rows.any?{ |rows| rows.all? { |char| char == "O"}}, 
                   cols.any?{ |cols| cols.all? { |char| char == "O"}},
                   diags.any?{ |cols| cols.all? { |char| char == "O"}}]

    draw = board.all?{ |cells| cells.none? { |char| char == " "}}
    player1 = player1_arr.any?{ |match| match == true}
    player2 = player2_arr.any?{ |match| match  == true}
            
    get_winner(main_board, player, board, endgame, marker, rows, cols, diags, draw, player1, player2)
  end
end 