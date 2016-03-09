module Accumulate
  def accumulate
  	return enum_for(:each) unless block_given?
    arr = []
    each { |item| arr << yield(item) }
    arr
  end
end

Array.include Accumulate
