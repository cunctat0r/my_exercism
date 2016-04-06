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
    @series
      .chars
      .each_cons(num_of_digits)
      .to_a
      .map { |arr| arr.map(&:to_i).reduce(:*) }
      .sort
      .last
  end
end
