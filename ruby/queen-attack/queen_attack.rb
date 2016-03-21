#
class Queens
  attr_reader :white, :black
  def initialize(*options)
    if options.empty?
      @white = [0, 3]
      @black = [7, 3]
    else
      raise ArgumentError if options[0][:white] == options[0][:black]
      @white = options[0][:white]
      @black = options[0][:black]
    end
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
