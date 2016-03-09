# I think, this is not the Ruby Way
class Series
  def initialize(vars)
    @init = vars
  end

  def slices(range)
    raise ArgumentError if range > @init.length
    arr = []
    0.upto(@init.length - 1) do |i|
      slice = []
      @init[i...i + range].each_char { |c| slice << c.to_i }
      arr << slice if slice.length == range
    end
    arr
  end
end
