#
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @read_pointer = 0
    @write_pointer = 0
    @size = size
    @buffer = Array.new(@size, nil)
  end

  def read
    raise BufferEmptyException if @buffer.compact.empty?
    data = @buffer[@read_pointer]
    @buffer[@read_pointer] = nil
    increment_read_pointer
    data
  end

  def write(data)
    raise BufferFullException if @buffer.all?
    @buffer[@write_pointer] = data
    increment_write_pointer
  end

  def write!(data)
    @buffer[@write_pointer] = data
    increment_read_pointer if @buffer.all? && (@write_pointer == @read_pointer)
    increment_write_pointer
  end

  def clear
    @buffer = Array.new(@size)
  end

  private

  def increment_read_pointer
    @read_pointer = (@read_pointer + 1) % @size
  end

  def increment_write_pointer
    @write_pointer = (@write_pointer + 1) % @size
  end
end
