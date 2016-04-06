# I think, this is not the Ruby Way
class Series
  def initialize(vars)
    @init = vars
  end

  def slices(range)
    raise ArgumentError if range > @init.length
    (0..@init.length - range).to_a.each_with_object([]) do |char, slice|
      slice << @init[char, range].chars.map(&:to_i)
    end
  end
end
