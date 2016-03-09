module Accumulate
  def accumulate
    arr = []
    each { |item| arr << yield(item) }
    arr
  end
end

Array.include Accumulate
