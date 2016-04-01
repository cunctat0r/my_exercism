#
class Triplet
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(factor)
    min_factor = factor[:min_factor] || 1
    max_factor = factor[:max_factor]
    (min_factor..max_factor).each_with_object([]) do |a, result|
      a.upto(max_factor) do |b|
        b.upto(max_factor) do |c|
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
  end
end
