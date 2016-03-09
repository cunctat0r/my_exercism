module Accumulate
  def accumulate
    each_with_object([]) { |elem, arr| arr << yield(elem) }
  end
end

Array.include Accumulate