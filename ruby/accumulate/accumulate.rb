#
module Accumulate
  def accumulate
    return enum_for(:accumulate) unless block_given?
    each_with_object([]) { |item, arr| arr << yield(item) }
  end
end

Array.include Accumulate
