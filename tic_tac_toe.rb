
board =[[' ', ' ', ' '],[ ' ', ' ', ' '],[ ' ', ' ', ' ']]

class Player
  
end

class Computer < Player
  def place_marker(board)
    joined_arr = board.flatten
    if joined_arr.all?(" ")
      joined_arr[0] = "X"
      joined_arr.shuffle!.each_slice(3).to_a
    else
      board.find{|(x, y)| }
    end
  end
end

class Human < Player
  def place_marker(board)
    p "place marker"
    input = gets.chomp.to_i
    case input >= 1 && input <= 9 && board.flatten[input-1] == " "
    when input == 1 
      board[0][0] = "O"
      return board
    when input == 2 
      board[0][1] = "O"
      return board
    when input == 3
      board[0][2] = "O"
      return board
    when input == 4 
      board[1][0] = "O"
      return board
    when input == 5
      board[1][1] = "O"
      return board
    when input == 6
      board[1][2] = "O"
      return board
    when input == 7
      board[2][0] = "O"
      return board
    when input == 8
      board[2][1] = "O"
      return board
    when input == 9
      board[2][2] = "O" 
      return board
    else
      p "Wrong input. Try again."
      place_marker(board)
    end
  end
end

def draw_board(board)
  puts "                                         "
  puts " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
  puts "-----------"
  puts " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
  puts "-----------"
  puts " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
end

draw_board(board)
cpu = Computer.new
board = cpu.place_marker(board)
draw_board(board)
human = Human.new
human.place_marker(board)
draw_board(board)