class Board 
  attr_reader :board
  def initialize(board)
    @board = Array.new(3) { Array.new(3, nil) }
  end
  def update(row, col, piece)
    if @board[row][col].nil?
      @board[row][col] = piece
      true
    else
      puts "Please choose an empty spot"
      false
    end
  end
  def print
    @board.each { |row| puts row.inspect }
  end
end

board = Board.new(Array.new(3) { Array.new(3, nil)})
board.print

