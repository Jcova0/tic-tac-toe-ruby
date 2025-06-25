require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Alice", "X")
player2 = Player.new("Bob", "O")

board = Board.new(nil)  # the parameter is unused, so pass nil or remove it

game = Game.new(player1, player2, board.board)

until game.check_game_over
  puts "#{game.current_player.name} enter a row 0-2: "
  row = gets.to_i
  puts "#{game.current_player.name} enter a row 0-2: "
  col = gets.to_i

  while ((row < 0 || row > 2) || (col < 0 || col > 2))
    puts "Please choose a valid position"
    puts "#{game.current_player.name} enter a row 0-2: "
    row = gets.to_i
    puts "#{game.current_player.name} enter a row 0-2: "
    col = gets.to_i
  end

  while (!board.update(row, col, game.current_player.piece))
    puts "That spot is taken. Please try again."
    puts "#{game.current_player.name} enter a row 0-2: "
    row = gets.to_i
    puts "#{game.current_player.name} enter a row 0-2: "
    col = gets.to_i
  end

  board.print
  game.check_game_over
  game.switch_player unless game.check_game_over
end

if game.winner
  puts "#{game.winner.name} wins!"
elsif game.board_full?
  puts "It's a draw!"
end

# start by getting user input and asking them to choose a row and column to put their piece in
# then switch to player 2 and do the same, but make sure to check if the spot they're putting
# the piece in isn't occupied
# each time a piece is placed, you need to check if a win condition has been met
# do all of this, until game over is achieved
# row and col, and then putting that into my board