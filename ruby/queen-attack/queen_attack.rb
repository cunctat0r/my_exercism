#
class Queens
  attr_reader :white, :black
  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    board = Array.new(8) { Array.new(8, '_') }
    board[@white[0]][@white[1]] = 'W'
    board[@black[0]][@black[1]] = 'B'
    board.each_with_object([]) { |row, obj|  obj << row.join(' ') }.join("\n")
  end

  def attack?
    return true if @white[0] == @black[0] || @white[1] == @black[1]
    return true if (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
    false
  end
end
