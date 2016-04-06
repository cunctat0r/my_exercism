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
    (0..@series.length - num_of_digits)
      .to_a
      .each_with_object([]) do |num, arr|
        arr << @series[num, num_of_digits]
               .chars
               .map(&:to_i)
               .reduce(:*)
      end
      .sort
      .last
  end
end
