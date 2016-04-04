#
class Series
  VERSION = 1
  def initialize(series)
    @series = series
  end

  def largest_product(num_of_digits)
    return 1 if num_of_digits == 0
    raise ArgumentError if num_of_digits < 0
    raise ArgumentError if num_of_digits > @series.length
    raise ArgumentError unless @series =~ /^[0-9]+$/
    arr = []
    0.upto(@series.length - num_of_digits) do |num|
      set = @series[num, num_of_digits]
      arr << set.chars.map(&:to_i).reduce(:*)
    end    
    arr.sort.last
  end
end
