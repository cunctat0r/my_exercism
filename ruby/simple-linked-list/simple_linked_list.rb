#
class Element
  attr_reader :datum, :next
  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil? ? true : false
  end
end
#
class SimpleLinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def empty?
    @head.nil?
  end

  def push(elem)
    if @head.nil?
      @head = Element.new(elem, nil)
      @tail = @head
    else
      @head = Element.new(elem, @head)
    end
    @size += 1
  end

  def peek
    @head.nil? ? nil : @head.datum
  end

  def pop
    return nil if @head.nil?
    tmp =  @head.datum
    @head = @head.next
    @size -= 1
    tmp
  end

  def self.from_a(arr)
    lst = SimpleLinkedList.new
    return lst if arr.nil?
    arr.reverse_each { |elem| lst.push(elem) }
    lst
  end

  def to_a
    arr = []
    return arr if empty?
    arr << pop while @size > 0
    arr
  end

  def reverse
    new_list = SimpleLinkedList.new
    new_list.push(pop) while @size > 0
    new_list
  end
end
