class Game 
  attr_reader :player1, :player2, :board, :current_player
  WIN_STATES = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Diagonal \
    [2, 4, 6]  # Diagonal /
  ] 

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player = player1
    @game_over = false
  end

  def game_state(piece)
    flat_board = @board.flatten
    WIN_STATES.any? do |combo|
      combo.all? { |index| flat_board[index] == piece }
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def board_full?
    @board.flatten.none?(&:nil?)
  end

  def game_over?(piece)
    game_state(piece) || board_full?
  end

  def check_game_over
    if game_over?(@current_player.piece)
      @game_over = true
    else
      @game_over = false
    end
  end

  def winner
    return player1 if game_state(player1.piece)
    return player2 if game_state(player2.piece)
    nil
  end
end