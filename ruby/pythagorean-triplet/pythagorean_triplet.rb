#
class Triplet
  def initialize(a, b, c)
    @triplet = [a, b, c]
  end

  def sum
    @triplet.reduce(:+)
  end

  def product
    @triplet.reduce(:*)
  end

  def pythagorean?
    a, b, c = @triplet
    a**2 + b**2 == c**2
  end

  def self.where(factor)
    min_factor = factor[:min_factor] || 1
    max_factor = factor[:max_factor]
    (min_factor..max_factor)
      .to_a
      .combination(3)
      .each_with_object([]) do |combination, result|
      a, b, c = combination
      t = Triplet.new(a, b, c)
      next unless t.pythagorean?
      if factor[:sum]
        result << t if t.sum == factor[:sum]
      else
        result << t
      end
    end
  end
end
