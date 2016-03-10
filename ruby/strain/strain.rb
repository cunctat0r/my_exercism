#
class Array
  def keep
    select { |item| item if yield(item) }
  end

  def discard
    select { |item| item unless yield(item) }
  end
end
