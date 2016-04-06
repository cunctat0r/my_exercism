#
class Series
  def initialize(vars)
    @init = vars
  end

  def slices(range)
    raise ArgumentError if range > @init.length
    @init.chars.each_cons(range).to_a.map do |arr|
      arr.map(&:to_i)
    end
  end
end
