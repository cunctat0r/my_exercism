#
class CustomSet
  attr_reader :result

  def initialize(input = [])
    @result = input.sort.uniq
  end

  def delete(item)
    @result.select { |x| x.to_s != item.to_s }
  end

  def inspect
    @result.inspect
  end

  def ==(other)
    inspect == other.inspect
  end

  def index(item)
    @result.index(item)
  end

  def difference(other)
    @result - other.result
  end

  def disjoint?(other)
    @result == difference(other)
  end

  def empty
    @result = []
  end

  def intersection(other)
    @result.select do |x|
      other.result.index(x) &&
        x.class == other.result.at(other.result.index(x)).class
    end
  end

  def member?(item)
    !index(item).nil? && item.class == @result.at(index(item)).class
  end

  def put(item)
    @result << item
    @result.sort.uniq
  end

  def size
    @result.length
  end

  def subset?(other)
    res = true
    other.result.each do |other_item|
      res &= member?(other_item)
    end
    res
  end

  def to_a
    @result
  end

  def union(other)
    @result += other.result
    @result.sort.uniq
  end
end
