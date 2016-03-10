class Array
  def keep
    return [] if self.empty?
    arr = []
    self.each { |item| arr << item if yield(item) }     
    arr
  end

  def discard
    return [] if self.empty?
    arr = []
    self.each { |item| arr << item unless yield(item) }
    arr
  end
end