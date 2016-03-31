#
class Node
  attr_accessor :prev_element, :datum, :next_element

  def initialize(prev_element, datum, next_element)
    @prev_element = prev_element
    @datum = datum
    @next_element = next_element
  end
end
#
class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    if @head.nil?
      @head = Node.new(nil, value, nil)
      @tail = @head
    else
      @head = Node.new(nil, value, @head)
      @head.next_element.prev_element = @head
    end
  end

  def pop
    tmp = @head
    @head = @head.next_element
    tmp.datum
  end

  def shift
    tmp = @tail
    @tail = @tail.prev_element
    tmp.datum
  end

  def unshift(value)
    if @tail.nil?
      @tail = Node.new(nil, value, nil)
      @head = @tail
    else
      @tail = Node.new(@tail, value, nil)
      @tail.prev_element.next_element = @tail
    end
  end
end
